# blogger_api 

This package to get Google Blogger Post and Page details from Blog using Blogger API.

## Images


:--------------------------------------:|:---------------------------------:

<img src="https://user-images.githubusercontent.com/58139175/210225315-694cf35f-9b2c-4e07-aab4-6d52fb54802e.png?raw=true" width="250">  |  <img src="https://user-images.githubusercontent.com/58139175/210225403-fb8a0857-25d8-4023-ab71-ac84e94dc620.png?raw=true)" width="250">

<img src="https://user-images.githubusercontent.com/58139175/210225548-06dd0b08-f47a-48e6-9573-7fe5c36b7e58.png?raw=true" width="250">  |  <img src="https://user-images.githubusercontent.com/58139175/210225637-7d97a25c-95a1-4ed1-9110-6243678eec0e.png?raw=true)" width="250">


#### Platform Support

| Android |  iOS  | MacOS |  Web  | Linux | Windows |
| :-----: | :---: | :---: | :---: | :---: | :-----: |
|    ✔️    |   ✔️   |   ✔️   |   ✔️   |   ✔️   |    ✔️    |


## Platform integration 

You don't need to include the google-services.json file in your app unless you are using Google services that require it. You do need to enable the Blogger API using [Google Cloud Platform API manager](https://console.cloud.google.com/apis/library/blogger.googleapis.com?project=docs-372812), and Create New Project then Go to Credentials Page and Create New credentials For API Key.


#### How to Use 

To use blogger_api, first start by importing the package.
```dart
import 'package:blogger_api/blogger_api.dart';
```

```
BloggerAPI bloggerAPI = BloggerAPI(
    blogId: 'Your Blog Id', 
    apiKey: 'Your API Key' 
)
```


#### Get Blog Details By Id

```
bloggerAPI.getBlogByID(
    blogId: 'Your Blog Id',
)
```

Return Type  `Future<BlogsModel>`


#### Get All the Blog Details By Ids

```
bloggerAPI.getBlogByID(
    blogIds: ['Your Blog Ids'], 
)
```

Return Type `Future<List<BlogsModel>>` 


#### Get All the Post Details By Blog Id

```
bloggerAPI.getAllPostFromBlog(
    includeComment: false // If need you can read all the Comments from Posts.
)
```

Return Type `Future<PostModel>`

#### Get All the Page Details By Blog Id

```
bloggerAPI.getAllPageFromBlog()
```

Return Type `Future<PageModel>`

`Author` and `Replies`  included in `PostItemModel` so can you read author and replies from Posts

#### Project Created & Maintained By

#### Gunanithi

Passionate #Flutter, #Android Developer. #UI Designer.


<a href="https://www.linkedin.com/in/imtheguna/"><img src="https://raw.githubusercontent.com/aritraroy/social-icons/master/linkedin-icon.png" alt="linkedin"  width="60"></a> <a href="https://medium.com/@imtheguna"><img src="https://raw.githubusercontent.com/aritraroy/social-icons/master/medium-icon.png" alt="medium" width="60"></a>

#### Issues, questions and contributing

You can raise issues [here](https://github.com/imtheguna/blogger_api/issues). Contributions are also welcome. You can do a pull request on GitHub [here](https://github.com/imtheguna/blogger_api/pulls). Please take a look at [up for grabs](https://github.com/imtheguna/blogger_api/issues) issues first.

#### Donate

You like the package ? Buy me a coffee :)

<a href="https://www.buymeacoffee.com/imtheguna" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

