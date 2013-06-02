# WolframAlpha
 
Wolfram|Alpha introduces a fundamentally new way to get knowledge and answers— not by searching the web, but by doing dynamic computations based on a vast collection of built-in data, algorithms, and methods.
 
## Installation
 
`gem install wolfram-alpha`

And that's it!

## Usage

Creating a client instance:

	require 'wolfram-alpha'

	options = { "format" => "plaintext" } # see the reference appendix in the documentation.[1]

	client = WolframAlpha::Client.new "MY-API-ID", options

**External links:**

1. [WolframAlpha API: Documentation](http://products.wolframalpha.com/api/documentation.html)

Querying the engine:

	response = client.query "5 largest countries"

Handling responses:

	input = response["Input"] # Get the input interpretation pod.
	result = response.find { |pod| pod.title == "Result" } # Get the result pod.

	puts "#{input.subpods[0].plaintext} = #{result.subpods[0].plaintext}"

	# 5 largest countries | by total area = 1 | Russia | 1.708×10^7 km^2 |
	# 2 | Canada | 9.985×10^6 km^2 |
	# 3 | United States | 9.631×10^6 km^2 |
	# 4 | China | 9.597×10^6 km^2 |
	# 5 | Brazil | 8.515×10^6 km^2 |
	# (vertical ellipsis) |   |   |

Beware that `WolframAlpha::Response#[]` is finding a pod by its id, and not by its title.
 
## Contributing
 
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request
 
## History
 
__v0.3__

+ Refactored the API.
+ Tidied up the code.

__v0.2__

+ Fixed query escaping.
+ Added documentation.

__v0.1__

+ Initial release.
 
## Credits
 
Mikkel Kroman <<mk@uplink.io>>
 
## License
	Copyright (c) 2013 Mikkel Kroman <mk@uplink.io>

	Permission to use, copy, modify, and distribute this software for any
	purpose with or without fee is hereby granted, provided that the above
	copyright notice and this permission notice appear in all copies.

	THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
	WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
	MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
	ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
	WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
	ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
	OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
