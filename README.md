# sifter-ruby

It's an API wrapper for the [Sifter API](http://sifterapp.com/developer). You
can use it to fetch projects, issues, milestones, and people from your Sifter
accounts.

## Getting started

First you'll need to generate a Sifter API token. You can do this in your
Sifter account by going to "My Profile", clicking "Access Keys" and filling out
form. Once you've got that, you create an account object like so:

    hostname = "example.sifterapp.com"
    token = "abc123"
    account = Sifter::Account.new(hostname, token)

All of the functionality in the Sifter API hangs off `Sifter::Account`. You can
fetch projects, issues, and milestones like so:

    projects = account.projects 
    issues = projects.first.issues
    milestones = projects.first.milestones

## License

    The MIT License

    Copyright (c) 2011 Next Update

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

