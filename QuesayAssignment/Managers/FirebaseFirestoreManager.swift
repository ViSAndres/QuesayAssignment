//
//  FirebsaeFirestoreManager.swift
//  QuesayAssignment
//
//  Created by Carlos Neira on 2/9/22.
//

import UIKit
import Firebase

class FirebaseFirestoreManager {
    let userID = Auth.auth().currentUser!.uid
    let firestore = Firestore.firestore()
    
    
    func getUserAge(completionBlock: @escaping (_ age: String?) -> Void) {
        firestore.collection("users").document(userID).getDocument { (docSnapshot, error) in
            if let doc = docSnapshot {
                if let age = doc.get("age") as? String {
                    completionBlock(age)
                } else {
                    print("error getting field")
                    completionBlock(nil)
                }
            } else {
                if let error = error {
                    print(error)
                }
                completionBlock(nil)
            }
        }
        }
    
    func getUserCountry(completionBlock: @escaping (_ country: String?) -> Void) {
            firestore.collection("users").document(userID).getDocument { (docSnapshot, error) in
                if let doc = docSnapshot {
                    if let country = doc.get("country") as? String {
                        completionBlock(country)
                    } else {
                        print("error getting field")
                        completionBlock(nil)
                    }
                } else {
                    if let error = error {
                        print(error)
                    }
                    completionBlock(nil)
                }
            }
        }
    
    func getUserPostCount(completionBlock: @escaping (_ postCount: String?) -> Void) {
            firestore.collection("users").document(userID).getDocument { (docSnapshot, error) in
                if let doc = docSnapshot {
                    if let postCount = doc.get("posts") as? String {
                        completionBlock(postCount)
                    } else {
                        print("error getting field")
                        completionBlock(nil)
                    }
                } else {
                    if let error = error {
                        print(error)
                    }
                    completionBlock(nil)
                }
            }
        }
    
    func setUserInfo(userInfo: [String]) {
        firestore.collection("users").document(userID).setData([
            "age" : userInfo[3],
            "country" : userInfo[4],
            "posts" : "25"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
