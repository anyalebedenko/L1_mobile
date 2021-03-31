//
//  ViewController.swift
//  Lebedenko_l1
//
//  Created by Anna Lebedenko on 02.03.2021.
//

import UIKit

class CellClass: UITableViewCell {
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        SetupInitialView()
    }
private func SetupInitialView()
{
    setChildView(subView: firstView)
}
   var currentSegmentTitle=""
    @IBOutlet weak var myContainerView: UIView!
    private var currentView: UIView?
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    
    }()
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    private let thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    lazy private var childView=[firstView, secondView, thirdView]
    @IBAction func segment_change_controller(_ sender: Any) {
        guard let segmentedControl = sender as? UISegmentedControl else {return}
        let childView = self.childView[segmentedControl.selectedSegmentIndex]
        setChildView(subView: childView)
       
    }
    
    private func setChildView(subView: UIView)
    {
        currentView?.removeFromSuperview()
        currentView=subView
        currentView?.translatesAutoresizingMaskIntoConstraints = false
        
        guard let currentView=currentView else {return}
        myContainerView.addSubview(currentView)
        
        NSLayoutConstraint.activate([
            currentView.topAnchor.constraint(equalTo: myContainerView.topAnchor),
            currentView.leadingAnchor.constraint(equalTo: myContainerView.leadingAnchor),
            currentView.trailingAnchor.constraint(equalTo: myContainerView.trailingAnchor),
            currentView.bottomAnchor.constraint(equalTo: myContainerView.bottomAnchor)
        ])
    }
    
    
    
    @IBOutlet weak var SelectType: UIButton!
    
    @IBOutlet weak var textBox_FirmaName: UITextField!
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var Result2: UILabel!
    @IBOutlet weak var Result3: UILabel!
    @IBOutlet weak var MySegments: UISegmentedControl!
    var FirmaNameText: String?
    var ProductTypeName: String?
    @IBAction func TypeSomething(_ sender: Any) {
        if textBox_FirmaName.text==nil || SelectType.currentTitle=="Тип товару"
        {
                    let alert = UIAlertController(title: "Warning", message: "Поле пустое", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
        }
        else
        {
        FirmaNameText=textBox_FirmaName.text!
        Result.text=FirmaNameText
        ProductTypeName=SelectType.currentTitle
        Result2.text=ProductTypeName
            if(MySegments.selectedSegmentIndex==0)
            {
                Result3.text="Red"
            }
            if(MySegments.selectedSegmentIndex==1)
            {
                Result3.text="Orange"
            }
            if(MySegments.selectedSegmentIndex==2)
            {
                Result3.text="Yellow"
            }
      
        

               
        }
        
    }
    
    @IBOutlet weak var cancel_button: UIButton!
    @IBOutlet weak var type_button_title: UIButton!
    @IBAction func Delete_data(_ sender: Any) {
        type_button_title.setTitle("Тип товару", for: .normal)
            Result.text=nil
            Result2.text=nil
            Result3.text=nil
            textBox_FirmaName.text=nil
    }
    
  
    @IBAction func goVC22(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc22=storyboard.instantiateViewController(identifier: "VC22") as? ViewController22
        {
            vc22.name1=textBox_FirmaName.text!
            vc22.name2=SelectType.currentTitle!
            show(vc22, sender: nil)
               
        }
    }
    let transparentView = UIView()
    
        let tableView = UITableView()
        var selectedButton = UIButton()
        var dataSource = [String]()
        
        
        func addTransparentView(frames: CGRect) {
            let window = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            transparentView.frame = window?.frame ?? self.view.frame
            self.view.addSubview(transparentView)
            
            tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
            self.view.addSubview(tableView)
            tableView.layer.cornerRadius = 5
            
            transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
            tableView.reloadData()
            let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
            transparentView.addGestureRecognizer(tapgesture)
            transparentView.alpha = 0
            UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.transparentView.alpha = 0.5
                self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
            }, completion: nil)
        }
        
        @objc func removeTransparentView() {
            let frames = selectedButton.frame
            UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.transparentView.alpha = 0
                self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
            }, completion: nil)
        }
    @IBAction func onClickSelectType(_ sender: Any) {
        dataSource = ["Не обрано","Кофе", "Чай", "Лимонад"]
                selectedButton = SelectType
                addTransparentView(frames: SelectType.frame)
    }
   
}
    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataSource.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = dataSource[indexPath.row]
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
            removeTransparentView()
        
    }
        
      
}

