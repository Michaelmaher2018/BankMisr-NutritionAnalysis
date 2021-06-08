//
//  IngredientModel.swift
//  NutritionAnalysis
//
//  Created by MacBook Pro on 05/06/2021.
//

struct IngredientModel: Codable {
    let calories:           Int?
    let cautions:           [String]?
    let dietLabels:         [String]?
    let healthLabels:       [String]?
    let totalDaily:         [String: KCALDetailsObjc]?
    let totalNutrients:     [String: KCALDetailsObjc]?
//    let totalNutrientsKCal: TotalNutrientsKCal?
    let totalWeight:        Int?
    let uri:                String?
    
    enum CodingKeys: String, CodingKey {
        case calories =             "calories"
        case cautions =             "cautions"
        case dietLabels =           "dietLabels"
        case healthLabels =         "healthLabels"
        case totalDaily =           "totalDaily"
        case totalNutrients =       "totalNutrients"
//        case totalNutrientsKCal =   "totalNutrientsKCal"
        case totalWeight =          "totalWeight"
        case uri =                  "uri"
    }
    
    init(ingredientEntered: String) {
        self.ingredientEntered = ingredientEntered
        self.totalWeight = 0
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        calories =           try values.decodeIfPresent(Int.self,                       forKey: .calories)
        cautions =           try values.decodeIfPresent([String].self,                  forKey: .cautions)
        dietLabels =         try values.decodeIfPresent([String].self,                  forKey: .dietLabels)
        healthLabels =       try values.decodeIfPresent([String].self,                  forKey: .healthLabels)
        totalDaily =         try values.decodeIfPresent([String: KCALDetailsObjc].self, forKey: .totalDaily)
        totalNutrients =     try values.decodeIfPresent([String: KCALDetailsObjc].self, forKey: .totalNutrients)
//        totalNutrientsKCal = try values.decodeIfPresent([String: KCALDetailsObjc].self, forKey: .totalNutrientsKCal)
        totalWeight =        try values.decodeIfPresent(Int.self,                       forKey: .totalWeight)
        uri =                try values.decodeIfPresent(String.self,                    forKey: .uri)
    }
}

struct KCALDetailsObjc: Codable {
    let label:      String?
    let quantity:   Int?
    let unit:       Unit?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        label =         try values.decodeIfPresent(String.self, forKey: .label)
        quantity =      try values.decodeIfPresent(Int.self, forKey: .quantity)
        unit =          try values.decodeIfPresent(Unit.self, forKey: .unit)
    }
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

//struct TotalNutrientsKCal: Codable {
//    let cHOCDFKCAL:     KCALDetailsObjc?
//    let eNERCKCAL:      KCALDetailsObjc?
//    let fATKCAL:        KCALDetailsObjc?
//    let pROCNTKCAL:     KCALDetailsObjc?
//
//    enum CodingKeys: String, CodingKey {
//        case cHOCDFKCAL =   "CHOCDF_KCAL"
//        case eNERCKCAL =    "ENERC_KCAL"
//        case fATKCAL =      "FAT_KCAL"
//        case pROCNTKCAL =   "PROCNT_KCAL"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        cHOCDFKCAL =    try values.decodeIfPresent(KCALDetailsObjc.self, forKey: .cHOCDFKCAL)
//        eNERCKCAL =     try values.decodeIfPresent(KCALDetailsObjc.self, forKey: .eNERCKCAL)
//        fATKCAL =       try values.decodeIfPresent(KCALDetailsObjc.self, forKey: .fATKCAL)
//        pROCNTKCAL =    try values.decodeIfPresent(KCALDetailsObjc.self, forKey: .pROCNTKCAL)
//    }
//}
//
//
//struct TotalNutrient: Codable {
//        let cA: KCALDetailsObjc?
//        let cHOCDF: KCALDetailsObjc?
//        let cHOLE: KCALDetailsObjc?
//        let eNERCKCAL: KCALDetailsObjc?
//        let fAMS: KCALDetailsObjc?
//        let fAPU: KCALDetailsObjc?
//        let fASAT: KCALDetailsObjc?
//        let fAT: KCALDetailsObjc?
//        let fE: KCALDetailsObjc?
//        let fIBTG: KCALDetailsObjc?
//        let fOLAC: KCALDetailsObjc?
//        let fOLDFE: KCALDetailsObjc?
//        let fOLFD: KCALDetailsObjc?
//        let k: KCALDetailsObjc?
//        let mG: KCALDetailsObjc?
//        let nA: KCALDetailsObjc?
//        let nIA: NIA?
//        let p: P?
//        let pROCNT: PROCNT?
//        let rIBF: RIBF?
//        let sUGAR: SUGAR?
//        let tHIA: THIA?
//        let tOCPHA: TOCPHA?
//        let vITARAE: VITARAE?
//        let vITB12: VITB12?
//        let vITB6A: VITB6A?
//        let vITC: VITC?
//        let vITD: VITD?
//        let vITK1: VITK1?
//        let wATER: WATER?
//        let zN: ZN?
//
//        enum CodingKeys: String, CodingKey {
//                case cA = "CA"
//                case cHOCDF = "CHOCDF"
//                case cHOLE = "CHOLE"
//                case eNERCKCAL = "ENERC_KCAL"
//                case fAMS = "FAMS"
//                case fAPU = "FAPU"
//                case fASAT = "FASAT"
//                case fAT = "FAT"
//                case fE = "FE"
//                case fIBTG = "FIBTG"
//                case fOLAC = "FOLAC"
//                case fOLDFE = "FOLDFE"
//                case fOLFD = "FOLFD"
//                case k = "K"
//                case mG = "MG"
//                case nA = "NA"
//                case nIA = "NIA"
//                case p = "P"
//                case pROCNT = "PROCNT"
//                case rIBF = "RIBF"
//                case sUGAR = "SUGAR"
//                case tHIA = "THIA"
//                case tOCPHA = "TOCPHA"
//                case vITARAE = "VITA_RAE"
//                case vITB12 = "VITB12"
//                case vITB6A = "VITB6A"
//                case vITC = "VITC"
//                case vITD = "VITD"
//                case vITK1 = "VITK1"
//                case wATER = "WATER"
//                case zN = "ZN"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                cA = CA(from: decoder)
//                cHOCDF = CHOCDF(from: decoder)
//                cHOLE = CHOLE(from: decoder)
//                eNERCKCAL = ENERCKCAL(from: decoder)
//                fAMS = FAM(from: decoder)
//                fAPU = FAPU(from: decoder)
//                fASAT = FASAT(from: decoder)
//                fAT = FAT(from: decoder)
//                fE = FE(from: decoder)
//                fIBTG = FIBTG(from: decoder)
//                fOLAC = FOLAC(from: decoder)
//                fOLDFE = FOLDFE(from: decoder)
//                fOLFD = FOLFD(from: decoder)
//                k = K(from: decoder)
//                mG = MG(from: decoder)
//                nA = NA(from: decoder)
//                nIA = NIA(from: decoder)
//                p = P(from: decoder)
//                pROCNT = PROCNT(from: decoder)
//                rIBF = RIBF(from: decoder)
//                sUGAR = SUGAR(from: decoder)
//                tHIA = THIA(from: decoder)
//                tOCPHA = TOCPHA(from: decoder)
//                vITARAE = VITARAE(from: decoder)
//                vITB12 = VITB12(from: decoder)
//                vITB6A = VITB6A(from: decoder)
//                vITC = VITC(from: decoder)
//                vITD = VITD(from: decoder)
//                vITK1 = VITK1(from: decoder)
//                wATER = WATER(from: decoder)
//                zN = ZN(from: decoder)
//        }
//
//}
//
//struct TotalDaily: Codable {
//
//        let cA: CA?
//        let cHOCDF: CHOCDF?
//        let cHOLE: CHOLE?
//        let eNERCKCAL: ENERCKCAL?
//        let fASAT: FASAT?
//        let fAT: FAT?
//        let fE: FE?
//        let fIBTG: FIBTG?
//        let fOLDFE: FOLDFE?
//        let k: K?
//        let mG: MG?
//        let nA: NA?
//        let nIA: NIA?
//        let p: P?
//        let pROCNT: PROCNT?
//        let rIBF: RIBF?
//        let tHIA: THIA?
//        let tOCPHA: TOCPHA?
//        let vITARAE: VITARAE?
//        let vITB12: VITB12?
//        let vITB6A: VITB6A?
//        let vITC: VITC?
//        let vITD: VITD?
//        let vITK1: VITK1?
//        let zN: ZN?
//
//        enum CodingKeys: String, CodingKey {
//                case cA = "CA"
//                case cHOCDF = "CHOCDF"
//                case cHOLE = "CHOLE"
//                case eNERCKCAL = "ENERC_KCAL"
//                case fASAT = "FASAT"
//                case fAT = "FAT"
//                case fE = "FE"
//                case fIBTG = "FIBTG"
//                case fOLDFE = "FOLDFE"
//                case k = "K"
//                case mG = "MG"
//                case nA = "NA"
//                case nIA = "NIA"
//                case p = "P"
//                case pROCNT = "PROCNT"
//                case rIBF = "RIBF"
//                case tHIA = "THIA"
//                case tOCPHA = "TOCPHA"
//                case vITARAE = "VITA_RAE"
//                case vITB12 = "VITB12"
//                case vITB6A = "VITB6A"
//                case vITC = "VITC"
//                case vITD = "VITD"
//                case vITK1 = "VITK1"
//                case zN = "ZN"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                cA = CA(from: decoder)
//                cHOCDF = CHOCDF(from: decoder)
//                cHOLE = CHOLE(from: decoder)
//                eNERCKCAL = ENERCKCAL(from: decoder)
//                fASAT = FASAT(from: decoder)
//                fAT = FAT(from: decoder)
//                fE = FE(from: decoder)
//                fIBTG = FIBTG(from: decoder)
//                fOLDFE = FOLDFE(from: decoder)
//                k = K(from: decoder)
//                mG = MG(from: decoder)
//                nA = NA(from: decoder)
//                nIA = NIA(from: decoder)
//                p = P(from: decoder)
//                pROCNT = PROCNT(from: decoder)
//                rIBF = RIBF(from: decoder)
//                tHIA = THIA(from: decoder)
//                tOCPHA = TOCPHA(from: decoder)
//                vITARAE = VITARAE(from: decoder)
//                vITB12 = VITB12(from: decoder)
//                vITB6A = VITB6A(from: decoder)
//                vITC = VITC(from: decoder)
//                vITD = VITD(from: decoder)
//                vITK1 = VITK1(from: decoder)
//                zN = ZN(from: decoder)
//        }
//
//}
