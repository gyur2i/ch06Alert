//
//  ViewController.swift
//  ch06Alert
//
//  Created by 김규리 on 2022/01/18.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn // 처음 이미지는 전구가 켜져 있는 이미지
    }
    
    // 전구 켜기
    @IBAction func btnLampOn(_ sender: UIButton) {
        // 전구가 켜져 있을 때
        if (isLampOn == true) {
            // 전구가 켜져 있다고 경고 메세지
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil) // handler가 아무 동작을 하지 않을 때 -> nil
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
        // 전구가 꺼져 있을 때
        else {
            // 전구를 켬
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    // 전구 끄기
    @IBAction func btnLampOff(_ sender: UIButton) {
        // 전구가 켜져 있을 때
        if isLampOn {
            // 전구를 끌 것인지 물음
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
                
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    // 전구 제거
    @IBAction func btnLampRemove(_ sender: UIButton) {
        // 항상 동일한 동작
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
            
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
            
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: { ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
            
        })

        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    
}

