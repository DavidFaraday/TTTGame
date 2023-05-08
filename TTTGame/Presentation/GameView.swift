//
//  GameView.swift
//  TTTGame
//
//  Created by David Kababyan on 30/04/2023.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel: GameViewModel
    
    @ViewBuilder
    private func closeButton() -> some View {
        HStack {
            Spacer()
            Button {
                viewModel.quitTheGame()
                dismiss()
            } label: {
                Text(AppStrings.exit)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            }
            .frame(width: 80, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
            )
            
        }
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    private func scoreView() -> some View {
        HStack {
            Text("\(viewModel.player1Name): \(viewModel.player1Score)")
            Spacer()
            Text("\(viewModel.player2Name): \(viewModel.player2Score)")
        }
        .foregroundColor(.white)
        .font(.title2)
        .fontWeight(.semibold)
    }
    
    @ViewBuilder
    private func gameStatus() -> some View {
        VStack {
            Text(viewModel.gameNotification)
                .font(.title2)
            if viewModel.showLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.white)
            }
        }
        .foregroundColor(.white)
    }
    
    @ViewBuilder
    private func gameBoard(geometry: GeometryProxy) -> some View {
        VStack {
            LazyVGrid(columns: viewModel.columns, spacing: 10) {
                ForEach(0..<9) { index in
                    
                    ZStack {
                        BoardCircleView(geometry: geometry)
                        BoardIndicatorView(imageName: viewModel.moves[index]?.indicator ?? "")
                    }
                    .onTapGesture {
                        viewModel.processMove(for: index)
                    }
                }
            }
        }
        .padding(.bottom, 10)
        .disabled(viewModel.isGameBoardDisabled)
    }
    
    @ViewBuilder
    private func main() -> some View {
        GeometryReader { geometry in
            
            VStack {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Spacer().frame(height: 40)
                }
                
                closeButton()
                scoreView()
                
                Spacer()
                gameStatus()
                Spacer()
                gameBoard(geometry: geometry)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 16)
            .background(Color.indigo)
        }
    }
    
    var body: some View {
        main()
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: viewModel.alertItem!.title,
                      message: viewModel.alertItem!.message,
                      dismissButton: .default(viewModel.alertItem!.buttonTitle) {
                    viewModel.resetGame()
                })
            }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(with: .vsHuman, onlineGameRepository: OnlineGameRepository()))
    }
}
