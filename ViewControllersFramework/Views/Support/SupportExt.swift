//
//  SupportExt.swift
//  MyFramework2
//
//  Created by Nicolás Acosta on 03/12/2020.
//

import Foundation
import UIKit
import MessageUI


extension Support {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Delegar messageField y subjectField en el view controller
        
        messageField.delegate = self
        subjectField.delegate = self
        
        
        //  Propiedades de subjectField
        
        subjectField.layer.cornerRadius = 5
        subjectField.layer.borderColor = UIColor.systemGray4.cgColor
        subjectField.layer.borderWidth = 1
        subjectField.returnKeyType = .next
        
        
        //  Propiedades de messageField
        
        messageField.textColor = .systemGray4
        messageField.layer.cornerRadius = 5
        messageField.layer.borderColor = UIColor.systemGray4.cgColor
        messageField.layer.borderWidth = 1
        messageField.text = "Write your message here"
        messageField.returnKeyType = .done
        
        
        //  Propiedades de mailButton
        
        mailButton.layer.cornerRadius = 5
        mailButton.titleColor(sendColor)
        
        
        // correr keyboardWillShow cada vez que se va a abrir el teclado
        
        NotificationCenter.default.addObserver(self, selector: #selector(Support.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        // correr keyboardWillHide cada vez que se va a cerrar el teclado
        
        NotificationCenter.default.addObserver(self, selector: #selector(Support.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    
    //  menuButton  ->  Mostrar menu
    
    @IBAction func menuAction(_ sender: Any) {
        menu()
    }
    
    
    //  sendButton  ->  Abrir mail para mandar
    
    @IBAction func mailAction(_ sender: Any) {
        mail()
    }
    

    
    
}



extension Support : UITextViewDelegate {
    
    //  Quitar placeholder al editar
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .systemGray4 {
            textView.text = nil
            textView.textColor = .white
        }
    }
    
    //  Agregar placeholder si esta vacío
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write your message here"
            textView.textColor = .systemGray4
        }
        activeTextView = nil
    }
    
    //  Ocultar teclado al tocar en el boton Done
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    //  activeTextView = messageField   ->  Saber cuando se esta editando ese campo, para saber si se debe mover view al abrir el teclado
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        activeTextView = textView
        return true
    }
    
}



extension Support : UITextFieldDelegate {
    
    //  Pasar a messageField al tocar Siguiente
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == subjectField {
            messageField.becomeFirstResponder()
        }
        return true
    }
    
}


//  Mover view al abrir o cerrar teclado

extension Support {
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            //  si no se puede obtener el tamaño del teclado return
            return
        }
        
        var shouldMoveViewUp = false

        //  si está editando messageField
        if activeTextView == messageField {
            
            //  límite inferior de messageField (belowMessageField) es una vista vacía abajo de messageField
            let bottomOfTextView = belowMessageFieldView.convert(activeTextView!.bounds, to: self.view).maxY;
            
            //  alto de teclado
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            //  si el alto del teclado esta debajo del límite inferior de messageView, mover view
            if bottomOfTextView > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        
        //  si se debe mover -> mover view
        if shouldMoveViewUp {
            self.view.frame.origin.y = 0 - (keyboardSize.height * 0.7)
        }
    
    }

    // Volver a posición original al cerrar el teclado
    @objc func keyboardWillHide(notifiation: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    
}




//  Envío de mail

extension Support : MFMailComposeViewControllerDelegate {
    
    //  generar mail
    func mail() {
        
        //  si se puede mandar mail
        if MFMailComposeViewController.canSendMail() {
            
            
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            mail.setToRecipients(mailRecipients)
            
            let subject = subjectField.text
            let message = messageField.text
            
            if let text = subject, !text.isEmpty {
                mail.setSubject(text)
            } else {
                okAlert(title: "Subject empty", message: "You must write a subject")
            }
            
            if messageField.textColor != .systemGray4, !messageField.text.isEmpty {
                mail.setMessageBody(message!, isHTML: false)
            } else {
                okAlert(title: "Message empty", message: "You must write a message")
            }
            
            if subject != nil && messageField.textColor != .systemGray4 && !messageField.text.isEmpty {
                if !messageField.text.isEmpty {
                    self.present(mail, animated: true, completion: nil)
                }
                
            }
            
        } else {
            
        okAlert(title: "Mail unavailable", message: "Can't send email. Please write to support@blackhack.app")
            
        }
        
    }
    
}

