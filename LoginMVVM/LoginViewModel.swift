//
//  loginViewModel.swift
//  LoginMVVM
//
//  Created by 정경우 on 2023/09/18.
//

import Foundation

class LoginViewModel {
    
    var email: Observable<String?> = Observable("이메일을 적어주세요")
    var password = Observable("비밀번호를 적어주세요")
    var nickname = Observable("닉네임을 적어주세요")
    var location = Observable("지역을 적어주세요")
    var code = Observable("추천코드를 적어주세요")
    var emailInvaild = Observable(false)
    var passwordInvaild = Observable(false)
    var codeInvaild = Observable(false)
    var vaildation  = Observable(false)
    var invaildReason: [String] = ["","",""]

    
    func emailValidation() {
        if email.value!.contains("@") {
            emailInvaild.value = true
            invaildReason[0] = "확인"
        } else {
            emailInvaild.value = false
            invaildReason[0] = "올바른 이메일 형식이 아닙니다."
        }
    }
    func passwordValidation() {
        if password.value.count >= 6 && password.value.count <= 10 {
            passwordInvaild.value = true
            invaildReason[1] = "확인"

        } else {
            passwordInvaild.value = false
            invaildReason[1] = "비밀번호는 6자리 이상 10자리 이하로 입력해주세요."
        }
    }
    func codeInvaildation() {
        if code.value.count == 6 {
            codeInvaild.value = true
            invaildReason[2] = "확인"
        } else {
            codeInvaild.value = false
            invaildReason[2] = "코드는 6자리로 입력해주세요."
        }
    }
    
    func areVaild() {
        if codeInvaild.value, passwordInvaild.value, emailInvaild.value == true {
            vaildation.value = true
        } else {
            vaildation.value = false
            
        }
        
    }
    
    
    
    
    
}
