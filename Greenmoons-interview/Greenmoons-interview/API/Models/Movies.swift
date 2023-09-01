/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Movies : Codable {
	let id : Int?
	let movieCode : [String]?
	let title_en : String?
	let title_th : String?
	let rating : String?
	let rating_id : Int?
	let duration : Int?
	let release_date : String?
	let sneak_date : String?
	let synopsis_th : String?
	let synopsis_en : String?
	let director : String?
	let actor : String?
	let genre : String?
	let poster_ori : String?
	let poster_url : String?
	let trailer : String?
	let tr_ios : String?
	let tr_hd : String?
	let tr_sd : String?
	let tr_mp4 : String?
	let priority : String?
	let now_showing : String?
	let advance_ticket : String?
	let date_update : String?
	let show_buyticket : String?
	let trailer_cms_id : String?
	let trailer_ivx_key : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case movieCode = "movieCode"
		case title_en = "title_en"
		case title_th = "title_th"
		case rating = "rating"
		case rating_id = "rating_id"
		case duration = "duration"
		case release_date = "release_date"
		case sneak_date = "sneak_date"
		case synopsis_th = "synopsis_th"
		case synopsis_en = "synopsis_en"
		case director = "director"
		case actor = "actor"
		case genre = "genre"
		case poster_ori = "poster_ori"
		case poster_url = "poster_url"
		case trailer = "trailer"
		case tr_ios = "tr_ios"
		case tr_hd = "tr_hd"
		case tr_sd = "tr_sd"
		case tr_mp4 = "tr_mp4"
		case priority = "priority"
		case now_showing = "now_showing"
		case advance_ticket = "advance_ticket"
		case date_update = "date_update"
		case show_buyticket = "show_buyticket"
		case trailer_cms_id = "trailer_cms_id"
		case trailer_ivx_key = "trailer_ivx_key"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		movieCode = try values.decodeIfPresent([String].self, forKey: .movieCode)
		title_en = try values.decodeIfPresent(String.self, forKey: .title_en)
		title_th = try values.decodeIfPresent(String.self, forKey: .title_th)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		rating_id = try values.decodeIfPresent(Int.self, forKey: .rating_id)
		duration = try values.decodeIfPresent(Int.self, forKey: .duration)
		release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
		sneak_date = try values.decodeIfPresent(String.self, forKey: .sneak_date)
		synopsis_th = try values.decodeIfPresent(String.self, forKey: .synopsis_th)
		synopsis_en = try values.decodeIfPresent(String.self, forKey: .synopsis_en)
		director = try values.decodeIfPresent(String.self, forKey: .director)
		actor = try values.decodeIfPresent(String.self, forKey: .actor)
		genre = try values.decodeIfPresent(String.self, forKey: .genre)
		poster_ori = try values.decodeIfPresent(String.self, forKey: .poster_ori)
		poster_url = try values.decodeIfPresent(String.self, forKey: .poster_url)
		trailer = try values.decodeIfPresent(String.self, forKey: .trailer)
		tr_ios = try values.decodeIfPresent(String.self, forKey: .tr_ios)
		tr_hd = try values.decodeIfPresent(String.self, forKey: .tr_hd)
		tr_sd = try values.decodeIfPresent(String.self, forKey: .tr_sd)
		tr_mp4 = try values.decodeIfPresent(String.self, forKey: .tr_mp4)
		priority = try values.decodeIfPresent(String.self, forKey: .priority)
		now_showing = try values.decodeIfPresent(String.self, forKey: .now_showing)
		advance_ticket = try values.decodeIfPresent(String.self, forKey: .advance_ticket)
		date_update = try values.decodeIfPresent(String.self, forKey: .date_update)
		show_buyticket = try values.decodeIfPresent(String.self, forKey: .show_buyticket)
		trailer_cms_id = try values.decodeIfPresent(String.self, forKey: .trailer_cms_id)
		trailer_ivx_key = try values.decodeIfPresent(String.self, forKey: .trailer_ivx_key)
	}
}
