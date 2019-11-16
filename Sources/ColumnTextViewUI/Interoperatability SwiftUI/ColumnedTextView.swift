//
//  ColumnedTextView.swift
//  ColumnTextViewUI
//
//  Created by Astemir Eleev on 16.11.2019.
//  Copyright © 2019 Astemir Eleev. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13, *)
public struct ColumnedTextView: View {
    
    // MARK: - State Porperties
    
    @State public private(set) var attributedString: NSMutableAttributedString = .init(string: "")
    @State public private(set) var font: UIFont? = nil
    @State public private(set) var fontSize: CGFloat = 0.0
    @State public private(set) var textColor: UIColor? = nil
        
    // MARK: - Conformance to View protocol
    
    public var body: some View {
        GeometryReader { geometry in
            ColumnTextViewRepresentable(
                size: geometry.size,
                attributedString: self.attributedString,
                font: self.font,
                fontSize: self.fontSize,
                textColor: self.textColor
            )
        }
    }
}

#if DEBUG

@available(iOS 13, *)
struct ColumnedTextView_Previews: PreviewProvider {
    
    static var previews: some View {
        ColumnedTextView(attributedString: text(), fontSize: 18)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            .previewDisplayName("iPhone 11 Pro")
        
    }
}

/// Test data
fileprivate func text() -> NSMutableAttributedString {
    let paraStyle = NSMutableParagraphStyle()
    paraStyle.alignment = .justified
    
    let attributedString: NSMutableAttributedString = .init(string: """
       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Haec quo modo conveniant, non sane intellego. At, illa, ut vobis placet, partem quandam tuetur, reliquam deserit. Quo modo autem optimum, si bonum praeterea nullum est? Tu enim ista lenius, hic Stoicorum more nos vexat. Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Teneo, inquit, finem illi videri nihil dolere. Quae cum dixisset paulumque institisset, Quid est?
       
       Ea possunt paria non esse. Non igitur de improbo, sed de callido improbo quaerimus, qualis Q. Dolor ergo, id est summum malum, metuetur semper, etiamsi non aderit; Reguli reiciendam; Quasi ego id curem, quid ille aiat aut neget. Urgent tamen et nihil remittunt. Qui ita affectus, beatum esse numquam probabis; Quis suae urbis conservatorem Codrum, quis Erechthei filias non maxime laudat? Quae diligentissime contra Aristonem dicuntur a Chryippo. Quicquid porro animo cernimus, id omne oritur a sensibus;
       
       Quoniam, si dis placet, ab Epicuro loqui discimus. Cuius quidem, quoniam Stoicus fuit, sententia condemnata mihi videtur esse inanitas ista verborum. Cur iustitia laudatur? Sed id ne cogitari quidem potest quale sit, ut non repugnet ipsum sibi. Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba.
       
       Hoc non est positum in nostra actione. At iam decimum annum in spelunca iacet. Si enim, ut mihi quidem videtur, non explet bona naturae voluptas, iure praetermissa est; Tubulo putas dicere?
       
       Restinguet citius, si ardentem acceperit. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Istam voluptatem perpetuam quis potest praestare sapienti? Recte dicis; Compensabatur, inquit, cum summis doloribus laetitia. Aut haec tibi, Torquate, sunt vituperanda aut patrocinium voluptatis repudiandum. Videamus animi partes, quarum est conspectus illustrior;
       
       Sint ista Graecorum; Sed ad bona praeterita redeamus. Quae fere omnia appellantur uno ingenii nomine, easque virtutes qui habent, ingeniosi vocantur. An eum locum libenter invisit, ubi Demosthenes et Aeschines inter se decertare soliti sunt? Hoc loco tenere se Triarius non potuit. Hinc ceteri particulas arripere conati suam quisque videro voluit afferre sententiam. Nonne videmus quanta perturbatio rerum omnium consequatur, quanta confusio? Minime vero istorum quidem, inquit. Vitiosum est enim in dividendo partem in genere numerare. Conferam avum tuum Drusum cum C. Sint modo partes vitae beatae. Qua tu etiam inprudens utebare non numquam.
       
       Non laboro, inquit, de nomine. Sin tantum modo ad indicia veteris memoriae cognoscenda, curiosorum. Sed tu istuc dixti bene Latine, parum plane. Aliud igitur esse censet gaudere, aliud non dolere. Ergo hoc quidem apparet, nos ad agendum esse natos. Si longus, levis. Quia dolori non voluptas contraria est, sed doloris privatio. Omnia contraria, quos etiam insanos esse vultis.
       
       Quo plebiscito decreta a senatu est consuli quaestio Cn. Facillimum id quidem est, inquam. Quantum Aristoxeni ingenium consumptum videmus in musicis? Duae sunt enim res quoque, ne tu verba solum putes. Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem; Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt;
       
       Nobis Heracleotes ille Dionysius flagitiose descivisse videtur a Stoicis propter oculorum dolorem. Cupiditates non Epicuri divisione finiebat, sed sua satietate. Negat enim summo bono afferre incrementum diem. Scio enim esse quosdam, qui quavis lingua philosophari possint; Si id dicis, vicimus. Hoc tu nunc in illo probas. Quo tandem modo? Quicquid enim a sapientia proficiscitur, id continuo debet expletum esse omnibus suis partibus; Ita multo sanguine profuso in laetitia et in victoria est mortuus. Mihi, inquam, qui te id ipsum rogavi?
       
       Haec quo modo conveniant, non sane intellego. Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum. Maximas vero virtutes iacere omnis necesse est voluptate dominante. Nihil enim hoc differt.
       
       Quid est, quod ab ea absolvi et perfici debeat? Quid est, quod ab ea absolvi et perfici debeat? Audio equidem philosophi vocem, Epicure, sed quid tibi dicendum sit oblitus es. Nec vero alia sunt quaerenda contra Carneadeam illam sententiam. Quamquam haec quidem praeposita recte et reiecta dicere licebit. Negat esse eam, inquit, propter se expetendam. Quae sequuntur igitur? Sequitur disserendi ratio cognitioque naturae;
       
       Eodem modo is enim tibi nemo dabit, quod, expetendum sit, id esse laudabile. Sic vester sapiens magno aliquo emolumento commotus cicuta, si opus erit, dimicabit. Huius ego nunc auctoritatem sequens idem faciam. Effluit igitur voluptas corporis et prima quaeque avolat saepiusque relinquit causam paenitendi quam recordandi.
       
       Eorum enim est haec querela, qui sibi cari sunt seseque diligunt. Stoicos roga. Sapiens autem semper beatus est et est aliquando in dolore; Quis istud, quaeso, nesciebat? O magnam vim ingenii causamque iustam, cur nova existeret disciplina! Perge porro. Si verbum sequimur, primum longius verbum praepositum quam bonum. Ne in odium veniam, si amicum destitero tueri.
       
       Ergo illi intellegunt quid Epicurus dicat, ego non intellego? Mihi quidem Antiochum, quem audis, satis belle videris attendere. Conferam tecum, quam cuique verso rem subicias; In his igitur partibus duabus nihil erat, quod Zeno commutare gestiret.
       
       An haec ab eo non dicuntur? Septem autem illi non suo, sed populorum suffragio omnium nominati sunt. Quae diligentissime contra Aristonem dicuntur a Chryippo. Eaedem enim utilitates poterunt eas labefactare atque pervertere. Quo studio Aristophanem putamus aetatem in litteris duxisse? Paulum, cum regem Persem captum adduceret, eodem flumine invectio? Serpere anguiculos, nare anaticulas, evolare merulas, cornibus uti videmus boves, nepas aculeis. Mihi enim erit isdem istis fortasse iam utendum.
       
       Quamquam haec quidem praeposita recte et reiecta dicere licebit. Quos quidem tibi studiose et diligenter tractandos magnopere censeo. An vero displicuit ea, quae tributa est animi virtutibus tanta praestantia?
       
       Compensabatur, inquit, cum summis doloribus laetitia. Vadem te ad mortem tyranno dabis pro amico, ut Pythagoreus ille Siculo fecit tyranno? Sed vos squalidius, illorum vides quam niteat oratio. Tum mihi Piso: Quid ergo? Egone non intellego, quid sit don Graece, Latine voluptas? Hanc quoque iucunditatem, si vis, transfer in animum; Itaque ab his ordiamur. Quae cum dixisset paulumque institisset, Quid est? Dat enim intervalla et relaxat.
       
       Neutrum vero, inquit ille. Bona autem corporis huic sunt, quod posterius posui, similiora. Plane idem, inquit, et maxima quidem, qua fieri nulla maior potest. Nam Pyrrho, Aristo, Erillus iam diu abiecti. Si stante, hoc natura videlicet vult, salvam esse se, quod concedimus; Quis est tam dissimile homini.
       
       Ad corpus diceres pertinere-, sed ea, quae dixi, ad corpusne refers? Quid igitur dubitamus in tota eius natura quaerere quid sit effectum? Ab his oratores, ab his imperatores ac rerum publicarum principes extiterunt. Tu vero, inquam, ducas licet, si sequetur; Nummus in Croesi divitiis obscuratur, pars est tamen divitiarum. Itaque hoc frequenter dici solet a vobis, non intellegere nos, quam dicat Epicurus voluptatem.
       
       Quorum sine causa fieri nihil putandum est. Sed nimis multa. Idem iste, inquam, de voluptate quid sentit? Unum est sine dolore esse, alterum cum voluptate. At Zeno eum non beatum modo, sed etiam divitem dicere ausus est. Cum praesertim illa perdiscere ludus esset. Nihil sane.
       """, attributes: [NSAttributedString.Key.paragraphStyle: paraStyle, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
    return attributedString
}

#endif
