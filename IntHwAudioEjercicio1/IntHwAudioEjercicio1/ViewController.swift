//
//  ViewController.swift
//  IntHwAudioEjercicio1
//
//  Created by Marcos on 24/12/16.
//  Copyright © 2016 MSR. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer!
    
    @IBOutlet weak var switchCG: UISwitch!
    
    @IBOutlet weak var switchLSV: UISwitch!
    
    @IBOutlet weak var labTitulo: UILabel!
    
    @IBOutlet weak var imgDisco: UIImageView!
    
    @IBAction func swCienGaviotas(_ sender: Any) {
        
        if (switchLSV.isOn){
            //se para la cancion
            if player.isPlaying{
                player.stop()
                player.currentTime=0
            }
            switchLSV.setOn(false, animated: true)
            
        }
        if (switchCG.isOn){
            labTitulo.text="Cien Gaviotas - Duncan Dhu"
            let sonidoURL = Bundle.main.url(forResource: "01 Cien Gaviotas", withExtension: "mp3")!
            let imgURL = Bundle.main.url(forResource: "ciengaviotas", withExtension: "jpeg")!
            let data = NSData(contentsOf:imgURL as URL)
            
            do {
                try player = AVAudioPlayer(contentsOf: sonidoURL)
                //player.play()
                imgDisco.image = UIImage(data:data! as Data)
            
            
            }catch{
                print ("Error al abrir cien gaviotas")
            }
        }else{
            if (player.isPlaying){
                player.stop()
                player.currentTime=0
                
            }
            labTitulo.text=""
            imgDisco.image=nil
        }
        
    }
    
   
    
    @IBAction func swLaSirenaVarada(_ sender: Any) {
        
        if (switchCG.isOn){
            //se para la cancion
            if player.isPlaying{
                player.stop()
                player.currentTime=0
            }
            switchCG.setOn(false, animated: true)
            
        }
        if (switchLSV.isOn){
            labTitulo.text="La Sirena Varada - Heroes del Silencio"
            let sonidoURL = Bundle.main.url(forResource: "05-La_Sirena_Varada", withExtension: "mp3")!
            let imgURL = Bundle.main.url(forResource: "lasirenavarada", withExtension: "jpeg")!
            let data = NSData(contentsOf:imgURL as URL)
            
            do {
                try player = AVAudioPlayer(contentsOf: sonidoURL)
                //player.play()
               imgDisco.image = UIImage(data:data! as Data)
                
            }catch{
                print ("Error al La sirena varada")
            }
        }else{
            if (player.isPlaying){
                player.stop()
                player.currentTime=0
                
            }
            labTitulo.text=""
            imgDisco.image=nil
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pulsarBotonPlay(_ sender: Any) {
        if ( switchCG.isOn || switchLSV.isOn){
            player.play()
        }
        
    }
    @IBAction func pulsarBotonPause(_ sender: Any) {
        if ( switchCG.isOn || switchLSV.isOn){
            player.pause()
        }
    }
    @IBAction func pulsarBotonStop(_ sender: Any) {
        if ( switchCG.isOn || switchLSV.isOn){
            player.stop()
            player.currentTime=0
        }
        
        
    }

    @IBAction func pulsarBotonUpVolume(_ sender: Any) {
        if ( switchCG.isOn || switchLSV.isOn){
            if player.volume < 1 {
                self.player.volume+=0.1
            }
        }
        /*
        let val = drand48()*100
        if (val > 50){
        }
        */
    }
    
    @IBAction func pulsarBotonDownVolume(_ sender: Any) {
        if ( switchCG.isOn || switchLSV.isOn){
            if player.volume > 0 {
                self.player.volume-=0.1
            }
        }
    }
}

