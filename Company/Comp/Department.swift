//  Employee.swift
//  Company

import Foundation

struct Department {
    var id: String
    var dname: String?
}

extension Department {
    init() {
        self.id = ""
        self.dname = "" 

    }
}

extension Department {
    init?(json: [String: Any]) {
        self.id = (json["id"] as? String)!
        self.dname = json["dname"] as? String ?? ""
       
    }
}

extension Department {
    
    static func getDepartments(completion: @escaping ([Department]) -> Void) {
        var departments: [Department] = []
        let getUrl = "departments"
        
        Api.read(getUrl: getUrl) { (data, succeeded, error)
            in
            
            if !succeeded {
                print(error as Any)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    let departmentsData = parsedData["data"] as! [[String:Any]]
                    
                    for case let result in departmentsData {
                        if let department = Department(json: result) {
                            departments.append(department)
                        }
                    }
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            completion(departments)
        }
        
    }
    
    static func deleteDepartment(emp: Department, postCompleted : @escaping (Bool, String) -> Void) {
        let deleteUrl = "departments/" + emp.id
        Api.write(method: "DELETE", body:[:],postUrl:deleteUrl, postCompleted:  { (succeeded: Bool, msg: String) -> () in
            
            if(succeeded) {
                print( "Success!")
            }
            else {
                print("Failed!")
            }
            postCompleted (succeeded, msg)
        })
    }
    
    static func createDepartment(emp: Department, postCompleted : @escaping (Bool, String) -> Void) {
        let createUrl = "department"
        Api.write(method: "POST",
                  body:["dname":emp.dname!]
            ,postUrl:createUrl, postCompleted:  { (succeeded: Bool, msg: String) -> () in
                
                if(succeeded) {
                    print( "Success!")
                }
                else {
                    print("Failed!")
                }
                postCompleted (succeeded, msg)
        })
    }
    
    static func updateEmployee(emp: Employee, postCompleted : @escaping (Bool, String) -> Void) {
        let updateUrl = "departments/" + emp.id
        Api.write(method: "PUT",
                  body:["dname":emp.dname!]
            ,postUrl:updateUrl, postCompleted:  { (succeeded: Bool, msg: String) -> () in
                
                if(succeeded) {
                    print( "Success!")
                }
                else {
                    print("Failed!")
                }
                postCompleted (succeeded, msg)
        })
    }
    
}
