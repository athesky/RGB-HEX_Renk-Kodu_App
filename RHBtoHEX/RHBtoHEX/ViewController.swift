
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redtxt: UITextField!
    @IBOutlet weak var grenntxt: UITextField!
    @IBOutlet weak var bluetxt: UITextField!
    @IBOutlet weak var selectedcolor: UILabel!
    
    @IBOutlet weak var renkkodusonuc: UITextField!
    @IBOutlet weak var btnconverter: UIButton!
    var secilenindex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        renkkodusonuc.isHidden  = true
      
    }

@IBAction func segmentchanged(_ sender: UISegmentedControl) {
//        burda rgb ve hex degisimleri icin girilen degerleri sifirlama islemi uyguladik
        redtxt.text?.removeAll()
        grenntxt.text?.removeAll()
        bluetxt.text?.removeAll()
        selectedcolor.text?.removeAll()
    renkkodusonuc.text?.removeAll()
        secilenindex = sender.selectedSegmentIndex
        if secilenindex == 0
        {
            btnconverter.setTitle("RGB => HEX", for : UIControl.State.normal)
        }
        else
        {
          btnconverter.setTitle("HEX => RGB", for : UIControl.State.normal)
        }}
    @IBAction func converterclicked(_ sender: UIButton) {
        
        
        if secilenindex == 0 {
            converRGBtoHEX()
        
        }  else {convertHEXtoRG()}
    }
    
//    rgb den donusum veya hex ten donusumn icin iki adet fonksiyon olusturduk ve bunlari yukarida action olarak atanan butonumuzda kontrol ederek cagiriyoruz
    
    func converRGBtoHEX(){
//        Guard let yapısı uygulanabilir ayrica !!
        renkkodusonuc.isHidden = false
        if let redvalue = UInt8(redtxt.text!){
            if let greenvalue = UInt8(grenntxt.text!){
                if let bluevalue = UInt8(bluetxt.text!){
                    let redhex = String(format : "%2x", redvalue)
                    let greenhex = String(format : "%2x", greenvalue)
                    let bluehex = String(format : "%2x", bluevalue)

                    selectedcolor.text = "\n \n Renk Kodunuz : \(redhex)\(greenhex)\(bluehex)  \n \n "
                    renkkodusonuc.text = "\n \n Renk Kodunuz : \(redhex)\(greenhex)\(bluehex)  \n \n "
                    selectedcolor.backgroundColor = UIColor(red: CGFloat(redvalue)/255, green: CGFloat(greenvalue)/255, blue: CGFloat(bluevalue)/255, alpha: 1)
                    
                    
                }}}}
    func convertHEXtoRG(){
//        Guard let yapısı uygulanabilir ayrica !!
        renkkodusonuc.isHidden = false
        if let redvalue = UInt8(redtxt.text! , radix: 16){
            if let greenvalue = UInt8(grenntxt.text!, radix: 16){
                if let bluevalue = UInt8(bluetxt.text!, radix : 16){
            selectedcolor.text = " \n RENK \n   "
                            selectedcolor.backgroundColor = UIColor(red: CGFloat(redvalue)/255, green: CGFloat(greenvalue)/255, blue: CGFloat(bluevalue)/255, alpha: 1)
                    renkkodusonuc.text = "KIRMIZI : \(redvalue) \n YEŞİL : \(greenvalue) \n MAVİ : \(bluevalue)"
                    
      
    }}}
}
}
