//
//  FireThread.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase

class FireThread {
    
    static func createThread(title: String) {
        if let userId = FireAuth.userId() {
            let db = Firestore.firestore()
            db.collection("threads")
                .addDocument(data: [
                    "createdAt": FieldValue.serverTimestamp(),
                    "userId": userId,
                    "title": title
                ]) { error in
                    if let error = error {
                        print("HELLO! Fail! Error adding new document. Error: \(error)")
                    } else {
                        print("HELLO! Success! Added new document.")
                    }
                }
        }
    }
}
