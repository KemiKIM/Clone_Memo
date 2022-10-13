//
//  ViewController.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/05.
// MemoListViewController


import UIKit

class ViewController: UIViewController {
    // MARK: -- 변수선언
    private lazy var titleView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var titleButton = UIButton()
    private lazy var tableView = UITableView()
    
    
    private lazy var formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    
    
    
    
    
    
    // MARK: -- Override View
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        //tableView.reloadData()
        //print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        
        token =
        NotificationCenter.default.addObserver(forName: AddViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.tableView.reloadData()
        }
        
        configure()
    }
    
    
    
    
    // MARK: -- 제약 Custom
    private func configure() {
        
        self.configureTitleView()
        self.configureTitleLabel()
        self.configureTitlePlusButton()
        //
        self.configureTableView()
        
        
    }
    
    // 1
    private func configureTitleView() {
        self.view.addSubview(self.titleView)
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.titleView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.titleView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.titleView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        self.titleView.backgroundColor = .lightGray
        
    }
    
    
    // 2
    private func configureTitleLabel() {
        self.titleView.addSubview(self.titleLabel)
        self.titleLabel.text = "List"
        self.titleLabel.font = .monospacedSystemFont(ofSize: 18, weight: .bold)
        //
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.titleView.topAnchor, constant: 20),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.titleView.centerXAnchor)
        ])
        
    }
    

    // 3
    private func configureTitlePlusButton() {
        self.titleView.addSubview(self.titleButton)
        self.titleButton.setTitle("추가", for: .normal)
        //
        self.titleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleButton.topAnchor.constraint(equalTo: self.titleView.topAnchor, constant: 15),
            self.titleButton.trailingAnchor.constraint(equalTo: self.titleView.trailingAnchor, constant: -20)
        ])
        
        
        self.titleButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        
      
    }
    
    
    @objc func addTapped(_sender: UIButton) {
        
        let vc = AddViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true)
    }
    
    
    // 4
    private func configureTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        //tableView.bounces = false
        
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
    
    

    
    

// MARK: ----------------------
}
// MARK: ----------------------




// MARK: -- extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Memo.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        let target = Memo.dummyData[indexPath.row]
        
        cell.textLabel?.text =  target.content
        
        cell.detailTextLabel?.text = formatter.string(from: target.contentDate)
        cell.detailTextLabel?.textColor = .lightGray
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        
        
        return cell
    }
    
    
    // cell을 누르면?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CellDetailViewController()

        // 데이터를 받아오는 코드 = 마치 prepare처럼
        vc.memo = Memo.dummyData[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    


    
    
    
}

