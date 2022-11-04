//
//  ViewController.swift
//  Clone_Memo_2
//
//  Created by 김성호 on 2022/10/05.
// MemoListViewController




// 참고하는 앱을 보니,
// 메인 뷰, 쓰기 뷰, 디테일 뷰가 다름.






import UIKit

class ViewController: UIViewController {
    let memoManager = CoreDataManager.shared
    // MARK: -- 변수선언
    private lazy var titleView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var titleButton = UIButton()
    private lazy var tableView: UITableView = {
        let t = UITableView()
        
        
        t.rowHeight = 60
        
        
        return t
        
    }()

    private lazy var bottomButton = UIButton()
   
    
    
    
    // MARK: -- Override View
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.reloadData()
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
    
    
    @objc func pullToRefresh(refresh: UIRefreshControl) {
        print("pullToRefresh()")
        refresh.endRefreshing()

        //새로고침 시 적용하고 싶은 코드.
        let vc = AddViewController()
        vc.modalPresentationStyle = .overFullScreen
    
        self.present(vc, animated: true)
        //self.navigationController?.pushViewController(vc, animated: true)

        // tableView.reloadData()
    }
    
    private func setUI() {
        //...
        // 당겨서 새로고침
        let refreshControl = UIRefreshControl()
        // 이미지 안보이게 하기
        refreshControl.tintColor = .clear
        // 문구 넣기
        // refreshControl.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
    
        refreshControl.addTarget(self, action: #selector(pullToRefresh(refresh:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    
    
    
    
    
    // MARK: -- 제약 Custom
    private func configure() {
        
        setUI()
        
        self.configureTitleView()
        self.configureTitleLabel()
        self.configureTitlePlusButton()
        //
        self.configureTableView()
        self.configureBottomButton()
        
        
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
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: PracticeTableViewCell.identifier)
        
        //tableView.bounces = false
        
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
    
    // 5
    private func configureBottomButton() {
        self.view.addSubview(self.bottomButton)
        
        self.bottomButton.setTitle("@", for: .normal)
        self.bottomButton.backgroundColor = .black
        
        self.bottomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.bottomButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    

    
    

// MARK: ----------------------
}
// MARK: ----------------------




// MARK: -- extension TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoManager.getDataFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell(style: .value1, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        let target = memoManager.getDataFromCoreData()[indexPath.row]

        // title, date
        cell.textLabel?.text = target.memoText
        cell.detailTextLabel?.text = target.dateString
        
        //custom
        cell.detailTextLabel?.textColor = .lightGray
        //cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
       
        return cell
    }
    
    
    // cell을 누르면?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 데이터를 받아오는 코드 = 마치 prepare처럼...  즉, 이 1줄이라는 건데....
        // CellDetailViewController의 memo 공간에, 본 데이터 공간의 인덱스 파트만 집어넣으면 된다?
        let vc = CellDetailViewController()
        // vc.memo = Memo.dummyData[indexPath.row]
        vc.memo = memoManager.getDataFromCoreData()[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // commit method, cell을 slide해서 삭제 표시 해주는 것.
    // 삭제 method 구현
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

         if editingStyle == .delete {
             // 삭제 코드
             
             // 정말 삭제하겠냐는 걸 물어보고 지우는게 나을 것 같은데?
             
             let target = memoManager.getDataFromCoreData()[indexPath.row]
             CoreDataManager.shared.deleteData(data: target) {
                 print("delete")
             }
            
             // 삭제 후 테이블뷰 행 정렬
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
     }
    
    
    
    // trailing swipe
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            print("Edit button tapped")
        }
        let delete = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            print("delete button tapped")
        }
        let swipeConfigureation = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipeConfigureation
    }
    
    
    // leading swipe
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let more = UIContextualAction(style: .normal, title: "") { _, _, _ in
            print("more button tapped")
        }
        
        let swipeConfigureation = UISwipeActionsConfiguration(actions: [more])
        return swipeConfigureation
    }
     
   
    
}

