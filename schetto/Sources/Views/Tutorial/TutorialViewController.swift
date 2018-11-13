//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TutorialViewController: UIViewController {
    
    private let pageCount = 5
    
    private var adapter: TutorialAdapter!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var skipButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = TutorialAdapter(collectionView, delegate: self)
        setupPageControl()
        updateButtons(last: false)
    }
    
    @IBAction private func didTapSkipButton() {
        Wireframe.showTerms(from: self)
    }
    
    @IBAction private func didTapNextButton() {
        // NOP.
    }
    
    @IBAction private func didTapStartButton() {
        // NOP.
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
    }
    
    private func updatePageControl() {
        
    }
    
    private func updateButtons(last: Bool) {
        skipButton.isHidden = last
        nextButton.isHidden = last
        startButton.isHidden = !last
    }
}

extension TutorialViewController: TutorialAdapterDelegate {
    
    func numberOfItems(in adapter: TutorialAdapter) -> Int {
        return pageCount
    }
    
    func tutorialAdapter(_ adapter: TutorialAdapter, itemAt index: Int) -> Any {
        return "hoge"
    }
    
    func tutorialAdapter(_ adapter: TutorialAdapter, didScrollAt x: CGFloat) {
        
    }
}
