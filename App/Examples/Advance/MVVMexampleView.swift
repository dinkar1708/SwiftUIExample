//
//  MVVMexampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/13.
//

import SwiftUI

// 1. define model
// model
struct Blog: Identifiable {
    let id: UUID = UUID()
    var title: String = ""
}

// 2. define repository
// repository
protocol BlogRepository {
    func getBlogs() -> [Blog]
}

// 3. define repository implementation
// repository implementation
class DefaultBlogRepository : BlogRepository {
    func getBlogs() -> [Blog] {
        return [
            Blog(title: "Accessing AWS RDS databases remotely with no exposed ports"), Blog(title: "Creating custom layouts with Compose -part 2-"), Blog(title: "Code Coverage with SonarQube and Bitrise for Swift")
        ]
    }
}

// 4. define view model and use repository
// view model
class BlogViewModel: ObservableObject {
    let blogsRepository : BlogRepository
    init( blogsRepository : BlogRepository =  DefaultBlogRepository()) {
        self.blogsRepository = blogsRepository
    }
    
    // get data
    @Published var blogs: [Blog] = []
    
    func loadBlogs() {
        blogs.removeAll()
        blogs = blogsRepository.getBlogs()
    }
}
// 5. define main view and use view model
// view
struct MVVMExampleView: View {
    @StateObject private var viewModel: BlogViewModel = BlogViewModel()
    var body: some View {
        List { // same as UITableView
            
            // 5.0 without 5.1 ui also get updated but with empty data
            if viewModel.blogs.isEmpty {
                Text("Empty data")
            }
            // 5.2 ui gets updated
            ForEach(viewModel.blogs) {
                // Need Blog: Identifiable, Why -> Initializer 'init(_:content:)' requires that 'Blog' conform to 'Identifiable'
                // List identify each object
                BlogRowView(blog: $0).background(Color.blue)
            }
        }.background(Color.yellow)
        .onAppear {
            // 5.1 get data, make little delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                viewModel.loadBlogs()
            }
        }
    }
}

// single row of view
struct BlogRowView: View {
    var blog: Blog
    var body: some View {
        HStack {
            Text(blog.title)
        }
    }
}

// preview
struct MVVMExampleView_Previews: PreviewProvider {
    static var previews: some View {
        MVVMExampleView()
    }
}
