//
//  TutorialPointsInfoCell.swift
//  Futboly
//
//  Created by Andrei Tanc on 14.10.2023.
//

import SwiftUI

struct TutorialPointsInfoCell: View {
    var pointsInfo: TutorialPointsInfo
    var type: PointsType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Image(pointsInfo.imageName)
                Spacer()
                Text("\(type.sign)\(pointsInfo.points)")
                    .foregroundStyle(type.color)
                    .font(.system(size: 16, weight: .semibold))
            }
            
            Text(pointsInfo.title)
                .foregroundStyle(.white)
                .font(.system(size: 17, weight: .semibold))
                .lineLimit(2, reservesSpace: type == .earn)
        }.padding()
        .frame(maxWidth: .infinity)
        .background(Color.darkPurpleLighter)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    TutorialPointsInfoCell(pointsInfo: EarnPointsInfo.defenderGoalkeeperGoal, type: .earn)
}

extension TutorialPointsInfoCell {
    enum PointsType {
        case earn
        case lose
        
        var sign: String {
            return switch self {
            case .earn: "+"
            case .lose: "-"
            }
        }
        
        var color: Color {
            return switch self {
            case .earn: .green
            case .lose: .red
            }
        }
    }
}
