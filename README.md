# VLTask

# Simple News App

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Advantages of Clean Swift](#Advantages-of-Clean-Swift)
* [Disadvantages of Clean Swift](#Disadvantages-of-Clean-Swift)
* [Some App Tests ](#Some-App-tests)

## General info
Onboarding
1. User should choose a favorite country to follow.
2. User should choose 3 favorite categories.
3. Onboarding should show only on the first time the user opens the app.
Headlines
1. User should see headlines from the selected country with the selected favorite
categories.
2. User should be able to search articles.
3. Data to show: Title, Date, Image, source newspaper, short description.
4. Headlines should be ordered by date.
5. On tapping on a headline, Open the article on safari.
4. User should be able to save their favorite articles to read later.
Favorites
1. User should see headlines for the favorite list.
2. User should be able to remove a headline from his favorite.
3. Favorites should have the same layout, order and on tap action of headlines.
	
## Technologies 
Project is created with:
* swift 
* Design Architecture: Clean Swift VIP Architecture
* Alamofire
* Data Persistence using Realm 
* Unit testing api with OHHTTPStubs
* JSON : Used in data parsing on the api level
* Protocols & Delegates  in VIP and in collection View delegate & datasource
* Error Handling: using  alerts  related to the first point
* Asynchronous programming :  calling api & persisting data in background thread 
* Design Patterns: Singleton for the api & data manager
	
## Clean Swift VIP

Clean Swift (a.k.a VIP) is Uncle Bob’s Clean Architecture applied to iOS and Mac projects. The Clean Swift Architecture is not a framework. It is a set of Xcode templates to generate the Clean Architecture components for you. That means you have the freedom to modify the templates to suit your needs.

![alt text](https://rubygarage.s3.amazonaws.com/uploads/article_image/file/1798/clean-swift-2x.png)

* View Controller
* Models
* Router
* Worker
* Interactor
* Presenter

# View Controller
View Controller starts and ends the VIP cycle
sends data to the Interactor
though it doesn’t get responses from the Interactor
This class has a one-sided interaction with the Presenter 
View Controller gets responses from the Presenter but can’t transfer anything to it
```swift
import UIKit

protocol ILaunchViewController: class {
	var router: ILaunchRouter? { get set }
}
class LaunchViewController: UIViewController {
	var interactor: ILaunchInteractor?
	var router: ILaunchRouter?
    override func viewDidLoad() {
        super.viewDidLoad()
    }   
}
extension LaunchViewController: ILaunchViewController {
}
```
# Models
The Models class is related to each component in the VIP model
 Models is a class containing such structures as Request, Response, and ViewModel:

* Request <br/>
A request model contains parameters sent to the API request, which are user inputs such as text entered in text fields and values chosen in pickers.
* Response <br/>
This type of model receives the response from the API and stores the appropriate data.
* ViewModel <br/>
This model encapsulates responses sent to the Presenter in primitive data types such as String and Int.
```swift
import UIKit
struct HeadlinesModel {	
	struct Request {
		// do someting...

		func parameters() -> [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
		// do someting...
	}
}
```
# Router
The Router deals with transitions by passing data between view controllers
this done with helper classes 

action occure in view controller call Router class with delegate method
```swift
 //MARK: - in View Controller 
   func getCategories(){
        router?.navigateToHeadlines()
    }
//MARK: - in Router
import UIKit

protocol ICategoriesRouter: class {
	func navigateToHeadlines()
}

class CategoriesRouter: ICategoriesRouter {	
	weak var view: CategoriesViewController?
	
	init(view: CategoriesViewController?) {
		self.view = view
	}
    func navigateToHeadlines(){
        view?.navigate(type: .modal, module: Route.headlines, completion: nil)
    }

}

  
```

* General Root <br/>
contain all modules 
routing from view controller and passing data trhough general root 
select you destination 
pass parameters to destination configration class 

```swift
import Foundation
import UIKit

enum Route: IRouter {
    case cats
    case headlines
}

extension Route {
    var module: UIViewController? {
        
        switch self {
        case .cats:
            return CategoriesConfiguration.setup()
        case .headlines:
            return HeadlinesConfiguration.setup()
        }
        
        
    }
}


```
# Presenter

The Presenter is responsible for presentation logic.
It decides how data will be presented to the user. 
The Presenter organizes the response sent by the Interactor into view models suitable for display.
Next, the Presenter passes those view models back to the View Controller to display to the user
```swift
protocol IHeadlinesPresenter: class {
    func showHeadlines(headlines: HeadlinesModel.Response)
}

class HeadlinesPresenter: IHeadlinesPresenter {	
	weak var view: IHeadlinesViewController?
	
	init(view: IHeadlinesViewController?) {
		self.view = view
	}
    
    func showHeadlines(headlines: HeadlinesModel.Response){
        view?.showHeadlines(headlines: headlines)

    }

}

```


# Advantages of Clean Swift
* Ready-made templates
* Unidirectional flow of data
* Testability
* Reusability
* Collaboration

# Disadvantages of Clean Swift
* Barriers to entry
* Over engineering

# Some App Tests 
# Unit Test
test functionalty of the app ( calling API ) 
using OHHTTPStubs to stub your network requests 
![alt text](https://github.com/AhmedibnAdam/VLTask/blob/master/Screen%20Shot%202021-08-11%20at%206.14.46%20PM.png)


