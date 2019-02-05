# trello-api

Unofficial Haskell [Servant](http://hackage.haskell.org/package/servant) bindings for
[Trello's REST API](https://developers.trello.com/).

All endpoints are defined in the `TrelloMonad` type class to allow them to be used alongside other Servant APIs in a type-safe way.
Note that as the bindings are generated from Trello's documentation, all releases may contain breaking changes and will be versioned as such.

