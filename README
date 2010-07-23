= cs_import

http://www.cloudsponge.com

== DESCRIPTION:

Spread the word with an email invite. Import contacts from Yahoo, Hotmail, MSN, Gmail, AOL, Outlook and Mac Address Book.

== FEATURES/PROBLEMS:

=== Problem
Websites looking to grow their customer base usually turn to traditional, paid methods of advertising like search engine keywords, media buys, and generic email lists. Though these methods can be effective at times, they are no match for the testimonial power your very own customers can bring. By encouraging your customers to promote your site to their family and friends, you have an inexpensive advertising channel to acquire customers. If one customer refers their friends, and their friends refer their friends, and so on, and so on, you now have a viral site!

=== Solution
  CloudSponge.com is THE tool you need to go viral! Here's how it works:
  * Ask your customers to invite all their friends and family to your site.
  * Use CloudSponge.com to pull your customer's contact list with their permission.
  * Send an email invite to all the contacts provided by CloudSponge.com.
  * Sit back and watch your customer base grow virally!

== SYNOPSIS:

  Usage:
  contacts = nil
  importer = Cloudsponge::ContactImporter.new(DOMAIN_KEY, DOMAIN_PASSWORD)
  resp = importer.begin_import('YAHOO')
  puts "Navigate to #{resp[:consent_url]} and complete the authentication process."
  loop do
    events = importer.get_events
    break unless events.select{ |e| e.is_error? }.empty?
    unless events.select{ |e| e.is_complete? }.empty?
      contacts = importer.get_contacts
      break
    end
  end

== REQUIREMENTS:

JSON decoding package, currently supported are ActiveSupport::JSON and the JSON gem.
  Neither of these are required, but if you don't have either on your system, a runtime 
  error will be generated.

== INSTALL:

sudo gem install cloudsponge

== LICENSE:

(The MIT License)

Copyright (c) 2010 Cloud Copy, Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
