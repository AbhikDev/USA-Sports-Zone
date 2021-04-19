/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct WpFeaturedmedia : Codable {
//	let id : Int?
//	let date : String?
//	let slug : String?
//	let type : String?
//	let link : String?
//	let title : Title?
//	let author : Int?
//	let acf : [String]?
//	let caption : Caption?
//	let alt_text : String?
//	let media_type : String?
//	let mime_type : String?
//	let media_details : Media_details?
	let source_url : String?
	//let _links : _links?

	enum CodingKeys: String, CodingKey {

//		case id = "id"
//		case date = "date"
//		case slug = "slug"
//		case type = "type"
//		case link = "link"
//		case title = "title"
//		case author = "author"
//		case acf = "acf"
//		case caption = "caption"
//		case alt_text = "alt_text"
//		case media_type = "media_type"
//		case mime_type = "mime_type"
//		case media_details = "media_details"
		case source_url = "source_url"
		//case _links = "_links"
	}

	

}
