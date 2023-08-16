# RestCountries
Rest Countries Take home test written in SwiftUI

Take home test description: 

The endpoint to use is free and publicly accessible at https://restcountries.com/.
All countries:
https://restcountries.com/v3.1/all
You will pass in the url param of {name} which will correspond to the search query. For example, the below query will give a result set
for the term deutschland .
Specific text, can be used for searching:
https://restcountries.com/v3.1/name/{name} https://restcountries.com/v3.1/name/deutschland

Note: Use appropriate SFSymbol wherever needed.
Write a client to consume the JSON results from the public API detailed be and meet these functional requirements:
1. On the launch of the app and home view, an unfiltered list of countries should be displayed with UX exactly matching the comp below
(Search Results)
2. As a user enters their search query, the result list should update in real-time (aka type-ahead search) when two or more characters
have been entered in the search.
3. When one of the results in the Results View list is tapped, the app should navigate to the Result Details view
4. The country detail screen should present detailed event information to the user for the selected Event with UX exactly matching the
comp below (Country Details)
5. All business logic in this phase should include adequate unit tests so that it is testable by peer code reviewers
7. Note: You can skip microphone support for Phase 1
Note: Use appropriate SFSymbol wherever needed.
![Simulator Screen Shot - iPhone 14 - 2023-08-16 at 15 07 41](https://github.com/heglinjon/RestCountries/assets/139373717/b784dae7-7d92-4501-be6f-b92926e7306c)


