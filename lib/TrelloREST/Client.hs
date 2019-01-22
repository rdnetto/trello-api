{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-unused-imports -fno-warn-missing-signatures -freduction-depth=0 #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE ViewPatterns #-}

module TrelloREST.Client (
    TrelloRESTClientMonad(..),
    actionsactionid,
    actionsid,
    actionsid1,
    actionsidactionreactions,
    actionsidactionreactions1,
    actionsidactionreactionsid,
    actionsidactionreactionsid1,
    actionsidactionreactionssummary,
    actionsidboard,
    actionsidcard,
    actionsiddisplay,
    actionsidfield,
    actionsidlist,
    actionsidmember,
    actionsidmembercreator,
    actionsidorganization,
    actionsidtext,
    batch1,
    boardsNestedResources,
    boardsboardid1,
    boardsboardidactions,
    boardsboardidactions1,
    boardsboardidactions2,
    boardsboardidactions3,
    boardsboardidcardsfilter,
    boardsboardididtags,
    boardsboardidlabels,
    boardsboardidlists,
    boardsboardidlistsfilter,
    boardsboardidmembers,
    boardsboardidtest,
    boardsid,
    boardsid1,
    boardsidboardplugins,
    boardsidboardplugins1,
    boardsidboardplugins2,
    boardsidcalendarkeygenerate,
    boardsidcustomfields,
    boardsidemailkeygenerate,
    boardsididtags,
    boardsidlabelnamesmembers,
    boardsidlabelnamesmembershipsidmembership,
    boardsidlabelnamesmembersidmember,
    boardsidlabels,
    boardsidlists,
    boardsidmarkedasviewed,
    boardsidmemberships,
    boardsidmembersidmember,
    boardsidmyprefsemailposition,
    boardsidmyprefsidemaillist,
    boardsidmyprefsshowlistguide,
    boardsidmyprefsshowsidebae,
    boardsidmyprefsshowsidebaractivity,
    boardsidmyprefsshowsidebarboardactions,
    boardsidmyprefsshowsidebarmembers,
    boardsidplugins,
    boardsidpowerups,
    boardsidpowerupspowerup,
    cards2,
    cardsid,
    cardsid1,
    cardsidactions,
    cardsidactionscomments,
    cardsidactionsidactioncomments,
    cardsidactionsidactioncomments1,
    cardsidattachments,
    cardsidattachments1,
    cardsidattachmentsidattachment,
    cardsidattachmentsidattachment1,
    cardsidboard,
    cardsidcardchecklistidchecklistcheckitemidcheckitem,
    cardsidcheckitemidcheckitem,
    cardsidcheckitemidcheckitem1,
    cardsidcheckitemidcheckitem2,
    cardsidcheckitemstates,
    cardsidchecklists,
    cardsidchecklists1,
    cardsidchecklistsidchecklist,
    cardsidcustomfielditems,
    cardsidfield,
    cardsididlabels,
    cardsididlabelsidlabel,
    cardsididmembers,
    cardsididmembersidmember,
    cardsidlabels,
    cardsidlist,
    cardsidmarkassociatednotificationsread,
    cardsidmembers,
    cardsidmembersvoted,
    cardsidmembersvoted1,
    cardsidmembersvotedidmember,
    cardsidplugindata,
    cardsidstickers,
    cardsidstickersidsticker,
    cardsidstickersidsticker1,
    cardsidstickersidsticker2,
    checklists,
    checklistsid,
    checklistsid1,
    checklistsid2,
    checklistsidboard,
    checklistsidcards,
    checklistsidcardscheckitems,
    checklistsidcardscheckitemscheckitemid,
    checklistsidcheckitems,
    checklistsidcheckitemsid,
    checklistsidcheckitemsidcheckitem,
    checklistsidfield,
    checklistsidname,
    customfielditemsid,
    customfields,
    customfieldsid,
    customfieldsid1,
    customfieldsid3,
    customfieldsidoptions1,
    customfieldsidoptions2,
    customfieldsidoptionsidcustomfieldoption1,
    customfieldsidoptionsidcustomfieldoption3,
    deleteCard,
    emoji,
    enterprisesid,
    enterprisesidadmins,
    enterprisesidadminsidmember,
    enterprisesidadminsidmember1,
    enterprisesidadminsidmember2,
    enterprisesidmembers,
    enterprisesidmembersidmember,
    enterprisesidmembersidmemberdeactivated1,
    enterprisesidsignupurl,
    enterprisesidtokens,
    enterprisesidtransferrableorganizationidorganization,
    id,
    id1,
    id2,
    idcolor,
    idname,
    idnext,
    lists1,
    listsid,
    listsid1,
    listsidactions,
    listsidarchiveallcards,
    listsidboard,
    listsidcards,
    listsidclosed,
    listsidfield,
    listsididboard,
    listsidmoveallcards,
    listsidname,
    listsidpos,
    listsidsubscribed,
    membersid,
    membersid1,
    membersidactions,
    membersidavatar,
    membersidboardbackgrounds,
    membersidboardbackgrounds1,
    membersidboardbackgroundsidbackground,
    membersidboardbackgroundsidbackground1,
    membersidboardbackgroundsidbackground2,
    membersidboards,
    membersidboardsinvited,
    membersidboardstars,
    membersidboardstars1,
    membersidboardstarsidstar,
    membersidboardstarsidstar1,
    membersidboardstarsidstar2,
    membersidcards,
    membersidcustomboardbackgrounds,
    membersidcustomboardbackgrounds1,
    membersidcustomboardbackgroundsidbackground,
    membersidcustomboardbackgroundsidbackground1,
    membersidcustomemoji,
    membersidcustomemoji1,
    membersidcustomemojiidemoji,
    membersidcustomstickers,
    membersidcustomstickers1,
    membersidcustomstickersidsticker1,
    membersidenterprises,
    membersidfield,
    membersidnotifications,
    membersidonetimemessagesdismissed,
    membersidorganizations,
    membersidorganizationsinvited,
    membersidsavedsearches,
    membersidsavedsearches1,
    membersidsavedsearchesidsearch,
    membersidsavedsearchesidsearch1,
    membersidsavedsearchesidsearch2,
    membersidtokens,
    notificationsallread,
    notificationsid,
    notificationsid1,
    notificationsidboard,
    notificationsidcard,
    notificationsidfield,
    notificationsidlist,
    notificationsidmember,
    notificationsidmembercreator,
    notificationsidorganization,
    notificationsidunread,
    organizations1,
    organizationsid,
    organizationsid1,
    organizationsid2,
    organizationsidactions,
    organizationsidboards,
    organizationsidfield,
    organizationsidlogo,
    organizationsidlogo1,
    organizationsidmembers,
    organizationsidmembers1,
    organizationsidmembersfilter,
    organizationsidmemberships,
    organizationsidmembershipsidmembership,
    organizationsidmembersidmember,
    organizationsidmembersidmember1,
    organizationsidmembersidmemberall,
    organizationsidmembersidmemberdeactivated,
    organizationsidmembersinvited,
    organizationsidnewbillableguestsidboard,
    organizationsidplugindata,
    organizationsidprefsassociateddomain,
    organizationsidprefsorginviterestrict,
    organizationsidtags,
    organizationsidtags1,
    organizationsidtagsidtag,
    page1,
    putMembersidcustomboardbackgroundsidbackground,
    search1,
    searchmembers,
    tokenstoken,
    tokenstoken1,
    tokenstokenmember,
    tokenstokenwebhooks,
    tokenstokenwebhooks1,
    tokenstokenwebhooks2,
    tokenstokenwebhooksidwebhook,
    tokenstokenwebhooksidwebhook1,
    webhookObject1,
    webhooks2,
    webhooksid,
    webhooksid1,
    webhooksidfield,
  ) where

import TrelloREST.API
import TrelloREST.Common
import TrelloREST.Types

import Data.Coerce (coerce)
import qualified Data.Map as Map
import Data.Proxy (Proxy(..))
import Prelude
import Servant.API
import Servant.Client (ClientM, client, hoistClient)

import Data.ByteString (ByteString)
import Data.Text (Text)
import Data.Time.Calendar (Day)


-- | Monads in which client calls may be embedded.
class Monad m => TrelloRESTClientMonad m where
  liftTrelloRESTClient :: ClientM a -> m a


-- We generate the clients directly from the routes as a workaround for https://github.com/haskell-servant/servant/issues/986
{- | Get information about an action -}
actionsactionid :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
actionsactionid x0 x1 x2 x3 x4 x5 x6 x7  = actionsactionid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7)  where
  actionsactionid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsactionidRoute

{- | Update a comment action -}
actionsid :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsid x0 x1  = actionsid' (coerce x0) (coerce x1)  where
  actionsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidRoute

{- | Delete a comment action -}
actionsid1 :: TrelloRESTClientMonad m => Text -> m ()
actionsid1 x0  = actionsid1' (coerce x0)  where
  actionsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Actionsid1Route

{- | List reactions for an action -}
actionsidactionreactions :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> m ()
actionsidactionreactions x0 x1 x2  = actionsidactionreactions' (coerce x0) (coerce x1) (coerce x2)  where
  actionsidactionreactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidactionreactionsRoute

{- | List reactions for an action -}
actionsidactionreactions1 :: TrelloRESTClientMonad m => Text -> Body_1 -> m ()
actionsidactionreactions1 x0 x1  = actionsidactionreactions1' (coerce x0) (coerce x1)  where
  actionsidactionreactions1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Actionsidactionreactions1Route

{- | Get information for a reaction -}
actionsidactionreactionsid :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> Maybe Bool -> m ()
actionsidactionreactionsid x0 x1 x2 x3  = actionsidactionreactionsid' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  actionsidactionreactionsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidactionreactionsidRoute

{- | Deletes a reaction -}
actionsidactionreactionsid1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
actionsidactionreactionsid1 x0 x1  = actionsidactionreactionsid1' (coerce x0) (coerce x1)  where
  actionsidactionreactionsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Actionsidactionreactionsid1Route

{- | List a summary of all reactions for an action -}
actionsidactionreactionssummary :: TrelloRESTClientMonad m => Text -> m ()
actionsidactionreactionssummary x0  = actionsidactionreactionssummary' (coerce x0)  where
  actionsidactionreactionssummary' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidactionreactionssummaryRoute

{- | Get the board for an action -}
actionsidboard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsidboard x0 x1  = actionsidboard' (coerce x0) (coerce x1)  where
  actionsidboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidboardRoute

{- | Get the card for an action -}
actionsidcard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsidcard x0 x1  = actionsidcard' (coerce x0) (coerce x1)  where
  actionsidcard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidcardRoute

{- | Get the display information for an action. -}
actionsiddisplay :: TrelloRESTClientMonad m => Text -> m ()
actionsiddisplay x0  = actionsiddisplay' (coerce x0)  where
  actionsiddisplay' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsiddisplayRoute

{- | Get a specific property of an action -}
actionsidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
actionsidfield x0 x1  = actionsidfield' (coerce x0) (coerce x1)  where
  actionsidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidfieldRoute

{- | Get the list for an action -}
actionsidlist :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsidlist x0 x1  = actionsidlist' (coerce x0) (coerce x1)  where
  actionsidlist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidlistRoute

{- | Gets the member of an action (not the creator) -}
actionsidmember :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsidmember x0 x1  = actionsidmember' (coerce x0) (coerce x1)  where
  actionsidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidmemberRoute

{- | Gets the member who created the action -}
actionsidmembercreator :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsidmembercreator x0 x1  = actionsidmembercreator' (coerce x0) (coerce x1)  where
  actionsidmembercreator' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidmembercreatorRoute

{- | Get the organization of an action -}
actionsidorganization :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsidorganization x0 x1  = actionsidorganization' (coerce x0) (coerce x1)  where
  actionsidorganization' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidorganizationRoute

{- | Update a comment action -}
actionsidtext :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
actionsidtext x0 x1  = actionsidtext' (coerce x0) (coerce x1)  where
  actionsidtext' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ActionsidtextRoute

{- |  -}
batch1 :: TrelloRESTClientMonad m => Maybe Text -> m ()
batch1 x0  = batch1' (coerce x0)  where
  batch1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Batch1Route

{- |  -}
boardsNestedResources :: TrelloRESTClientMonad m => Text -> Text -> m ()
boardsNestedResources x0 x1  = boardsNestedResources' (coerce x0) (coerce x1)  where
  boardsNestedResources' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsNestedResourcesRoute

{- | Request a single board. -}
boardsboardid1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> m ()
boardsboardid1 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18  = boardsboardid1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18)  where
  boardsboardid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Boardsboardid1Route

{- |  -}
boardsboardidactions :: TrelloRESTClientMonad m => Text -> m ()
boardsboardidactions x0  = boardsboardidactions' (coerce x0)  where
  boardsboardidactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardidactionsRoute

{- |  -}
boardsboardidactions1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
boardsboardidactions1 x0 x1  = boardsboardidactions1' (coerce x0) (coerce x1)  where
  boardsboardidactions1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Boardsboardidactions1Route

{- |  -}
boardsboardidactions2 :: TrelloRESTClientMonad m => Text -> m ()
boardsboardidactions2 x0  = boardsboardidactions2' (coerce x0)  where
  boardsboardidactions2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Boardsboardidactions2Route

{- |  -}
boardsboardidactions3 :: TrelloRESTClientMonad m => Text -> m ()
boardsboardidactions3 x0  = boardsboardidactions3' (coerce x0)  where
  boardsboardidactions3' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Boardsboardidactions3Route

{- |  -}
boardsboardidcardsfilter :: TrelloRESTClientMonad m => Text -> Text -> m ()
boardsboardidcardsfilter x0 x1  = boardsboardidcardsfilter' (coerce x0) (coerce x1)  where
  boardsboardidcardsfilter' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardidcardsfilterRoute

{- |  -}
boardsboardididtags :: TrelloRESTClientMonad m => Text -> m ()
boardsboardididtags x0  = boardsboardididtags' (coerce x0)  where
  boardsboardididtags' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardididtagsRoute

{- |  -}
boardsboardidlabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Int -> m ()
boardsboardidlabels x0 x1 x2  = boardsboardidlabels' (coerce x0) (coerce x1) (coerce x2)  where
  boardsboardidlabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardidlabelsRoute

{- |  -}
boardsboardidlists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
boardsboardidlists x0 x1 x2 x3 x4  = boardsboardidlists' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  boardsboardidlists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardidlistsRoute

{- |  -}
boardsboardidlistsfilter :: TrelloRESTClientMonad m => Text -> Text -> m ()
boardsboardidlistsfilter x0 x1  = boardsboardidlistsfilter' (coerce x0) (coerce x1)  where
  boardsboardidlistsfilter' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardidlistsfilterRoute

{- | Get the members for a board -}
boardsboardidmembers :: TrelloRESTClientMonad m => Text -> m ()
boardsboardidmembers x0  = boardsboardidmembers' (coerce x0)  where
  boardsboardidmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardidmembersRoute

{- |  -}
boardsboardidtest :: TrelloRESTClientMonad m => Text -> m ()
boardsboardidtest x0  = boardsboardidtest' (coerce x0)  where
  boardsboardidtest' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsboardidtestRoute

{- | Create a new board. -}
boardsid :: TrelloRESTClientMonad m => Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> m ()
boardsid x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15  = boardsid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15)  where
  boardsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidRoute

{- | Delete a board. -}
boardsid1 :: TrelloRESTClientMonad m => Text -> m ()
boardsid1 x0  = boardsid1' (coerce x0)  where
  boardsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Boardsid1Route

{- | Get the enabled Power-Ups on a board -}
boardsidboardplugins :: TrelloRESTClientMonad m => Text -> m ()
boardsidboardplugins x0  = boardsidboardplugins' (coerce x0)  where
  boardsidboardplugins' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidboardpluginsRoute

{- | Enable a Power-Up on a board -}
boardsidboardplugins1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
boardsidboardplugins1 x0 x1  = boardsidboardplugins1' (coerce x0) (coerce x1)  where
  boardsidboardplugins1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Boardsidboardplugins1Route

{- | Disable a Power-Up on a board -}
boardsidboardplugins2 :: TrelloRESTClientMonad m => Text -> Text -> m ()
boardsidboardplugins2 x0 x1  = boardsidboardplugins2' (coerce x0) (coerce x1)  where
  boardsidboardplugins2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Boardsidboardplugins2Route

{- | Create a new board. -}
boardsidcalendarkeygenerate :: TrelloRESTClientMonad m => Text -> m ()
boardsidcalendarkeygenerate x0  = boardsidcalendarkeygenerate' (coerce x0)  where
  boardsidcalendarkeygenerate' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidcalendarkeygenerateRoute

{- | Get the Custom Field Definitions that exist on a board. -}
boardsidcustomfields :: TrelloRESTClientMonad m => Text -> m ()
boardsidcustomfields x0  = boardsidcustomfields' (coerce x0)  where
  boardsidcustomfields' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidcustomfieldsRoute

{- |  -}
boardsidemailkeygenerate :: TrelloRESTClientMonad m => Text -> m ()
boardsidemailkeygenerate x0  = boardsidemailkeygenerate' (coerce x0)  where
  boardsidemailkeygenerate' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidemailkeygenerateRoute

{- |  -}
boardsididtags :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
boardsididtags x0 x1  = boardsididtags' (coerce x0) (coerce x1)  where
  boardsididtags' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsididtagsRoute

{- | Update an existing board by id -}
boardsidlabelnamesmembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> Body_2 -> Maybe Text -> m ()
boardsidlabelnamesmembers x0 x1 x2 x3  = boardsidlabelnamesmembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  boardsidlabelnamesmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidlabelnamesmembersRoute

{- | Update an existing board by id -}
boardsidlabelnamesmembershipsidmembership :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> m ()
boardsidlabelnamesmembershipsidmembership x0 x1 x2 x3  = boardsidlabelnamesmembershipsidmembership' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  boardsidlabelnamesmembershipsidmembership' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidlabelnamesmembershipsidmembershipRoute

{- | Add a member to the board. -}
boardsidlabelnamesmembersidmember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
boardsidlabelnamesmembersidmember x0 x1 x2  = boardsidlabelnamesmembersidmember' (coerce x0) (coerce x1) (coerce x2)  where
  boardsidlabelnamesmembersidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidlabelnamesmembersidmemberRoute

{- |  -}
boardsidlabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
boardsidlabels x0 x1 x2  = boardsidlabels' (coerce x0) (coerce x1) (coerce x2)  where
  boardsidlabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidlabelsRoute

{- |  -}
boardsidlists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
boardsidlists x0 x1 x2  = boardsidlists' (coerce x0) (coerce x1) (coerce x2)  where
  boardsidlists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidlistsRoute

{- |  -}
boardsidmarkedasviewed :: TrelloRESTClientMonad m => Text -> m ()
boardsidmarkedasviewed x0  = boardsidmarkedasviewed' (coerce x0)  where
  boardsidmarkedasviewed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmarkedasviewedRoute

{- | Get information about the memberships users have to the board. -}
boardsidmemberships :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Text -> m ()
boardsidmemberships x0 x1 x2 x3 x4 x5  = boardsidmemberships' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  boardsidmemberships' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmembershipsRoute

{- |  -}
boardsidmembersidmember :: TrelloRESTClientMonad m => Text -> Text -> m ()
boardsidmembersidmember x0 x1  = boardsidmembersidmember' (coerce x0) (coerce x1)  where
  boardsidmembersidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmembersidmemberRoute

{- | Update an existing board by id -}
boardsidmyprefsemailposition :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
boardsidmyprefsemailposition x0 x1  = boardsidmyprefsemailposition' (coerce x0) (coerce x1)  where
  boardsidmyprefsemailposition' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmyprefsemailpositionRoute

{- | Update an existing board by id -}
boardsidmyprefsidemaillist :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
boardsidmyprefsidemaillist x0 x1  = boardsidmyprefsidemaillist' (coerce x0) (coerce x1)  where
  boardsidmyprefsidemaillist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmyprefsidemaillistRoute

{- | Update an existing board by id -}
boardsidmyprefsshowlistguide :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
boardsidmyprefsshowlistguide x0 x1  = boardsidmyprefsshowlistguide' (coerce x0) (coerce x1)  where
  boardsidmyprefsshowlistguide' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmyprefsshowlistguideRoute

{- | Update an existing board by id -}
boardsidmyprefsshowsidebae :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
boardsidmyprefsshowsidebae x0 x1  = boardsidmyprefsshowsidebae' (coerce x0) (coerce x1)  where
  boardsidmyprefsshowsidebae' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmyprefsshowsidebaeRoute

{- | Update an existing board by id -}
boardsidmyprefsshowsidebaractivity :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
boardsidmyprefsshowsidebaractivity x0 x1  = boardsidmyprefsshowsidebaractivity' (coerce x0) (coerce x1)  where
  boardsidmyprefsshowsidebaractivity' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmyprefsshowsidebaractivityRoute

{- | Update an existing board by id -}
boardsidmyprefsshowsidebarboardactions :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
boardsidmyprefsshowsidebarboardactions x0 x1  = boardsidmyprefsshowsidebarboardactions' (coerce x0) (coerce x1)  where
  boardsidmyprefsshowsidebarboardactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmyprefsshowsidebarboardactionsRoute

{- | Update an existing board by id -}
boardsidmyprefsshowsidebarmembers :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
boardsidmyprefsshowsidebarmembers x0 x1  = boardsidmyprefsshowsidebarmembers' (coerce x0) (coerce x1)  where
  boardsidmyprefsshowsidebarmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidmyprefsshowsidebarmembersRoute

{- | List the Power-Ups for a board -}
boardsidplugins :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
boardsidplugins x0 x1  = boardsidplugins' (coerce x0) (coerce x1)  where
  boardsidplugins' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidpluginsRoute

{- |  -}
boardsidpowerups :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
boardsidpowerups x0 x1  = boardsidpowerups' (coerce x0) (coerce x1)  where
  boardsidpowerups' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidpowerupsRoute

{- |  -}
boardsidpowerupspowerup :: TrelloRESTClientMonad m => Text -> Text -> m ()
boardsidpowerupspowerup x0 x1  = boardsidpowerupspowerup' (coerce x0) (coerce x1)  where
  boardsidpowerupspowerup' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy BoardsidpowerupspowerupRoute

{- | Create a new card -}
cards2 :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Day -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe ByteString -> Maybe Text -> Maybe Text -> m ()
cards2 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11  = cards2' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11)  where
  cards2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cards2Route

{- | Get a card by its ID -}
cardsid :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> m ()
cardsid x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18  = cardsid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18)  where
  cardsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidRoute

{- | Update a card -}
cardsid1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Day -> Maybe Bool -> Maybe Bool -> m ()
cardsid1 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12  = cardsid1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12)  where
  cardsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsid1Route

{- | List the actions on a card -}
cardsidactions :: TrelloRESTClientMonad m => Text -> m ()
cardsidactions x0  = cardsidactions' (coerce x0)  where
  cardsidactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidactionsRoute

{- | Add a new comment to a card -}
cardsidactionscomments :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidactionscomments x0 x1  = cardsidactionscomments' (coerce x0) (coerce x1)  where
  cardsidactionscomments' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidactionscommentsRoute

{- | Update an existing comment -}
cardsidactionsidactioncomments :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
cardsidactionsidactioncomments x0 x1 x2  = cardsidactionsidactioncomments' (coerce x0) (coerce x1) (coerce x2)  where
  cardsidactionsidactioncomments' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidactionsidactioncommentsRoute

{- | Delete a comment -}
cardsidactionsidactioncomments1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsidactionsidactioncomments1 x0 x1  = cardsidactionsidactioncomments1' (coerce x0) (coerce x1)  where
  cardsidactionsidactioncomments1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidactionsidactioncomments1Route

{- | List the attachments on a card -}
cardsidattachments :: TrelloRESTClientMonad m => Text -> m ()
cardsidattachments x0  = cardsidattachments' (coerce x0)  where
  cardsidattachments' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidattachmentsRoute

{- | Add an attachment to a card -}
cardsidattachments1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe ByteString -> Maybe Text -> Maybe Text -> m ()
cardsidattachments1 x0 x1 x2 x3 x4  = cardsidattachments1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  cardsidattachments1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidattachments1Route

{- | Get a specific attachment on a card -}
cardsidattachmentsidattachment :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
cardsidattachmentsidattachment x0 x1 x2  = cardsidattachmentsidattachment' (coerce x0) (coerce x1) (coerce x2)  where
  cardsidattachmentsidattachment' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidattachmentsidattachmentRoute

{- | Delete an attachment -}
cardsidattachmentsidattachment1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsidattachmentsidattachment1 x0 x1  = cardsidattachmentsidattachment1' (coerce x0) (coerce x1)  where
  cardsidattachmentsidattachment1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidattachmentsidattachment1Route

{- | Get the board a card is on -}
cardsidboard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidboard x0 x1  = cardsidboard' (coerce x0) (coerce x1)  where
  cardsidboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidboardRoute

{- | Update an item in a checklist on a card. -}
cardsidcardchecklistidchecklistcheckitemidcheckitem :: TrelloRESTClientMonad m => Text -> Text -> Text -> Maybe Text -> m ()
cardsidcardchecklistidchecklistcheckitemidcheckitem x0 x1 x2 x3  = cardsidcardchecklistidchecklistcheckitemidcheckitem' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  cardsidcardchecklistidchecklistcheckitemidcheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidcardchecklistidchecklistcheckitemidcheckitemRoute

{- | Get a specific checkItem on a card -}
cardsidcheckitemidcheckitem :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
cardsidcheckitemidcheckitem x0 x1 x2  = cardsidcheckitemidcheckitem' (coerce x0) (coerce x1) (coerce x2)  where
  cardsidcheckitemidcheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidcheckitemidcheckitemRoute

{- | Update an item in a checklist on a card. -}
cardsidcheckitemidcheckitem1 :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
cardsidcheckitemidcheckitem1 x0 x1 x2 x3 x4 x5  = cardsidcheckitemidcheckitem1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  cardsidcheckitemidcheckitem1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidcheckitemidcheckitem1Route

{- | Delete a checklist item -}
cardsidcheckitemidcheckitem2 :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsidcheckitemidcheckitem2 x0 x1  = cardsidcheckitemidcheckitem2' (coerce x0) (coerce x1)  where
  cardsidcheckitemidcheckitem2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidcheckitemidcheckitem2Route

{- | Get the completed checklist items on a card -}
cardsidcheckitemstates :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidcheckitemstates x0 x1  = cardsidcheckitemstates' (coerce x0) (coerce x1)  where
  cardsidcheckitemstates' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidcheckitemstatesRoute

{- | Get the checklists on a card -}
cardsidchecklists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
cardsidchecklists x0 x1 x2 x3 x4  = cardsidchecklists' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  cardsidchecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidchecklistsRoute

{- | Create a new checklist on a card -}
cardsidchecklists1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
cardsidchecklists1 x0 x1 x2 x3  = cardsidchecklists1' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  cardsidchecklists1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidchecklists1Route

{- | Delete a checklist from a card -}
cardsidchecklistsidchecklist :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsidchecklistsidchecklist x0 x1  = cardsidchecklistsidchecklist' (coerce x0) (coerce x1)  where
  cardsidchecklistsidchecklist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidchecklistsidchecklistRoute

{- | Get the custom field items for a card. -}
cardsidcustomfielditems :: TrelloRESTClientMonad m => Text -> m ()
cardsidcustomfielditems x0  = cardsidcustomfielditems' (coerce x0)  where
  cardsidcustomfielditems' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidcustomfielditemsRoute

{- | Get a specific property of a card -}
cardsidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsidfield x0 x1  = cardsidfield' (coerce x0) (coerce x1)  where
  cardsidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidfieldRoute

{- | Add a label to a card -}
cardsididlabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsididlabels x0 x1  = cardsididlabels' (coerce x0) (coerce x1)  where
  cardsididlabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsididlabelsRoute

{- | Remove a label from a card -}
cardsididlabelsidlabel :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsididlabelsidlabel x0 x1  = cardsididlabelsidlabel' (coerce x0) (coerce x1)  where
  cardsididlabelsidlabel' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsididlabelsidlabelRoute

{- | Add a member to a card -}
cardsididmembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsididmembers x0 x1  = cardsididmembers' (coerce x0) (coerce x1)  where
  cardsididmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsididmembersRoute

{- | Remove a member from a card -}
cardsididmembersidmember :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsididmembersidmember x0 x1  = cardsididmembersidmember' (coerce x0) (coerce x1)  where
  cardsididmembersidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsididmembersidmemberRoute

{- | Add a new label to a card -}
cardsidlabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
cardsidlabels x0 x1 x2  = cardsidlabels' (coerce x0) (coerce x1) (coerce x2)  where
  cardsidlabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidlabelsRoute

{- | Get the list a card is in -}
cardsidlist :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidlist x0 x1  = cardsidlist' (coerce x0) (coerce x1)  where
  cardsidlist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidlistRoute

{- | Mark notifications about this card as read -}
cardsidmarkassociatednotificationsread :: TrelloRESTClientMonad m => Text -> m ()
cardsidmarkassociatednotificationsread x0  = cardsidmarkassociatednotificationsread' (coerce x0)  where
  cardsidmarkassociatednotificationsread' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidmarkassociatednotificationsreadRoute

{- | Get the members on a card -}
cardsidmembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidmembers x0 x1  = cardsidmembers' (coerce x0) (coerce x1)  where
  cardsidmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidmembersRoute

{- | Get the members who have voted on a card -}
cardsidmembersvoted :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidmembersvoted x0 x1  = cardsidmembersvoted' (coerce x0) (coerce x1)  where
  cardsidmembersvoted' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidmembersvotedRoute

{- | Vote on the card -}
cardsidmembersvoted1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidmembersvoted1 x0 x1  = cardsidmembersvoted1' (coerce x0) (coerce x1)  where
  cardsidmembersvoted1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidmembersvoted1Route

{- | Remove a member's vote from a card -}
cardsidmembersvotedidmember :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsidmembersvotedidmember x0 x1  = cardsidmembersvotedidmember' (coerce x0) (coerce x1)  where
  cardsidmembersvotedidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidmembersvotedidmemberRoute

{- | Get any shared pluginData on a card -}
cardsidplugindata :: TrelloRESTClientMonad m => Text -> m ()
cardsidplugindata x0  = cardsidplugindata' (coerce x0)  where
  cardsidplugindata' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidplugindataRoute

{- | Get the stickers on a card -}
cardsidstickers :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
cardsidstickers x0 x1  = cardsidstickers' (coerce x0) (coerce x1)  where
  cardsidstickers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidstickersRoute

{- | Get a specific sticker on a card -}
cardsidstickersidsticker :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
cardsidstickersidsticker x0 x1 x2  = cardsidstickersidsticker' (coerce x0) (coerce x1) (coerce x2)  where
  cardsidstickersidsticker' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CardsidstickersidstickerRoute

{- | Remove a sticker from the card -}
cardsidstickersidsticker1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
cardsidstickersidsticker1 x0 x1  = cardsidstickersidsticker1' (coerce x0) (coerce x1)  where
  cardsidstickersidsticker1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidstickersidsticker1Route

{- | Update a sticker on a card -}
cardsidstickersidsticker2 :: TrelloRESTClientMonad m => Text -> Text -> Maybe Float -> Maybe Float -> Maybe Int -> Maybe Float -> m ()
cardsidstickersidsticker2 x0 x1 x2 x3 x4 x5  = cardsidstickersidsticker2' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  cardsidstickersidsticker2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Cardsidstickersidsticker2Route

{- |  -}
checklists :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
checklists x0 x1 x2 x3  = checklists' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  checklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsRoute

{- |  -}
checklistsid :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
checklistsid x0 x1 x2 x3 x4  = checklistsid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  checklistsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidRoute

{- | Update an existing checklist. -}
checklistsid1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
checklistsid1 x0 x1 x2  = checklistsid1' (coerce x0) (coerce x1) (coerce x2)  where
  checklistsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Checklistsid1Route

{- | Delete a checklist -}
checklistsid2 :: TrelloRESTClientMonad m => Text -> m ()
checklistsid2 x0  = checklistsid2' (coerce x0)  where
  checklistsid2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Checklistsid2Route

{- |  -}
checklistsidboard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
checklistsidboard x0 x1  = checklistsidboard' (coerce x0) (coerce x1)  where
  checklistsidboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidboardRoute

{- |  -}
checklistsidcards :: TrelloRESTClientMonad m => Text -> m ()
checklistsidcards x0  = checklistsidcards' (coerce x0)  where
  checklistsidcards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidcardsRoute

{- |  -}
checklistsidcardscheckitems :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
checklistsidcardscheckitems x0 x1 x2  = checklistsidcardscheckitems' (coerce x0) (coerce x1) (coerce x2)  where
  checklistsidcardscheckitems' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidcardscheckitemsRoute

{- |  -}
checklistsidcardscheckitemscheckitemid :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
checklistsidcardscheckitemscheckitemid x0 x1 x2  = checklistsidcardscheckitemscheckitemid' (coerce x0) (coerce x1) (coerce x2)  where
  checklistsidcardscheckitemscheckitemid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidcardscheckitemscheckitemidRoute

{- |  -}
checklistsidcheckitems :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
checklistsidcheckitems x0 x1 x2 x3  = checklistsidcheckitems' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  checklistsidcheckitems' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidcheckitemsRoute

{- | Remove an item from a checklist -}
checklistsidcheckitemsid :: TrelloRESTClientMonad m => Text -> Text -> m ()
checklistsidcheckitemsid x0 x1  = checklistsidcheckitemsid' (coerce x0) (coerce x1)  where
  checklistsidcheckitemsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidcheckitemsidRoute

{- | Update check item. -}
checklistsidcheckitemsidcheckitem :: TrelloRESTClientMonad m => Text -> Text -> Maybe Int -> m ()
checklistsidcheckitemsidcheckitem x0 x1 x2  = checklistsidcheckitemsidcheckitem' (coerce x0) (coerce x1) (coerce x2)  where
  checklistsidcheckitemsidcheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidcheckitemsidcheckitemRoute

{- |  -}
checklistsidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
checklistsidfield x0 x1  = checklistsidfield' (coerce x0) (coerce x1)  where
  checklistsidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidfieldRoute

{- |  -}
checklistsidname :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
checklistsidname x0 x1  = checklistsidname' (coerce x0) (coerce x1)  where
  checklistsidname' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ChecklistsidnameRoute

{- | Setting, updating, and removing the value for a Custom Field on a card. -}
customfielditemsid :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
customfielditemsid x0 x1 x2  = customfielditemsid' (coerce x0) (coerce x1) (coerce x2)  where
  customfielditemsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CustomfielditemsidRoute

{- | Create a new Custom Field on a board. -}
customfields :: TrelloRESTClientMonad m => Body -> m ()
customfields x0  = customfields' (coerce x0)  where
  customfields' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CustomfieldsRoute

{- | Update a Custom Field definition. -}
customfieldsid :: TrelloRESTClientMonad m => Text -> Body_3 -> m ()
customfieldsid x0 x1  = customfieldsid' (coerce x0) (coerce x1)  where
  customfieldsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy CustomfieldsidRoute

{- | Delete a Custom Field from a board. -}
customfieldsid1 :: TrelloRESTClientMonad m => Text -> m ()
customfieldsid1 x0  = customfieldsid1' (coerce x0)  where
  customfieldsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Customfieldsid1Route

{- |  -}
customfieldsid3 :: TrelloRESTClientMonad m => Text -> m ()
customfieldsid3 x0  = customfieldsid3' (coerce x0)  where
  customfieldsid3' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Customfieldsid3Route

{- | Get the options of a drop down Custom Field -}
customfieldsidoptions1 :: TrelloRESTClientMonad m => Text -> m ()
customfieldsidoptions1 x0  = customfieldsidoptions1' (coerce x0)  where
  customfieldsidoptions1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Customfieldsidoptions1Route

{- | Add an option to a dropdown Custom Field -}
customfieldsidoptions2 :: TrelloRESTClientMonad m => Text -> m ()
customfieldsidoptions2 x0  = customfieldsidoptions2' (coerce x0)  where
  customfieldsidoptions2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Customfieldsidoptions2Route

{- | Delete an option from a Custom Field dropdown. -}
customfieldsidoptionsidcustomfieldoption1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
customfieldsidoptionsidcustomfieldoption1 x0 x1  = customfieldsidoptionsidcustomfieldoption1' (coerce x0) (coerce x1)  where
  customfieldsidoptionsidcustomfieldoption1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Customfieldsidoptionsidcustomfieldoption1Route

{- |  -}
customfieldsidoptionsidcustomfieldoption3 :: TrelloRESTClientMonad m => Text -> Text -> m ()
customfieldsidoptionsidcustomfieldoption3 x0 x1  = customfieldsidoptionsidcustomfieldoption3' (coerce x0) (coerce x1)  where
  customfieldsidoptionsidcustomfieldoption3' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Customfieldsidoptionsidcustomfieldoption3Route

{- | Delete a card -}
deleteCard :: TrelloRESTClientMonad m => Text -> m ()
deleteCard x0  = deleteCard' (coerce x0)  where
  deleteCard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardRoute

{- | List available emoji -}
emoji :: TrelloRESTClientMonad m => Maybe Text -> Maybe Bool -> m ()
emoji x0 x1  = emoji' (coerce x0) (coerce x1)  where
  emoji' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EmojiRoute

{- | Get an enterprise by its ID. -}
enterprisesid :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
enterprisesid x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13  = enterprisesid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13)  where
  enterprisesid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidRoute

{- | Get an enterprise's admin members. -}
enterprisesidadmins :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
enterprisesidadmins x0 x1  = enterprisesidadmins' (coerce x0) (coerce x1)  where
  enterprisesidadmins' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidadminsRoute

{- | Transfer an organization to an enterprise. -}
enterprisesidadminsidmember :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
enterprisesidadminsidmember x0 x1  = enterprisesidadminsidmember' (coerce x0) (coerce x1)  where
  enterprisesidadminsidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidadminsidmemberRoute

{- | Make member an admin of enterprise. -}
enterprisesidadminsidmember1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
enterprisesidadminsidmember1 x0 x1  = enterprisesidadminsidmember1' (coerce x0) (coerce x1)  where
  enterprisesidadminsidmember1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Enterprisesidadminsidmember1Route

{- | Remove an member as admin from an enterprise. -}
enterprisesidadminsidmember2 :: TrelloRESTClientMonad m => Text -> Text -> m ()
enterprisesidadminsidmember2 x0 x1  = enterprisesidadminsidmember2' (coerce x0) (coerce x1)  where
  enterprisesidadminsidmember2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Enterprisesidadminsidmember2Route

{- | Get the members of an enterprise. -}
enterprisesidmembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
enterprisesidmembers x0 x1 x2 x3 x4 x5 x6 x7 x8 x9  = enterprisesidmembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9)  where
  enterprisesidmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidmembersRoute

{- | Get a specific member of an enterprise by ID. -}
enterprisesidmembersidmember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
enterprisesidmembersidmember x0 x1 x2 x3 x4  = enterprisesidmembersidmember' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  enterprisesidmembersidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidmembersidmemberRoute

{- | Deactivate a member of an enterprise. -}
enterprisesidmembersidmemberdeactivated1 :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
enterprisesidmembersidmemberdeactivated1 x0 x1 x2 x3 x4 x5  = enterprisesidmembersidmemberdeactivated1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  enterprisesidmembersidmemberdeactivated1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Enterprisesidmembersidmemberdeactivated1Route

{- | Get the signup URL for an enterprise. -}
enterprisesidsignupurl :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> m ()
enterprisesidsignupurl x0 x1 x2 x3 x4  = enterprisesidsignupurl' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  enterprisesidsignupurl' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidsignupurlRoute

{- | Generate an auth token for an enterprise. -}
enterprisesidtokens :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
enterprisesidtokens x0 x1  = enterprisesidtokens' (coerce x0) (coerce x1)  where
  enterprisesidtokens' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidtokensRoute

{- | Get whether an organization can be transferred to an enterprise. -}
enterprisesidtransferrableorganizationidorganization :: TrelloRESTClientMonad m => Text -> Text -> m ()
enterprisesidtransferrableorganizationidorganization x0 x1  = enterprisesidtransferrableorganizationidorganization' (coerce x0) (coerce x1)  where
  enterprisesidtransferrableorganizationidorganization' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy EnterprisesidtransferrableorganizationidorganizationRoute

{- | Get information about a label by ID. -}
id :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
id x0 x1  = id' (coerce x0) (coerce x1)  where
  id' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy IdRoute

{- | Update a label by ID. -}
id1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
id1 x0 x1 x2  = id1' (coerce x0) (coerce x1) (coerce x2)  where
  id1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Id1Route

{- | Delete a label by ID. -}
id2 :: TrelloRESTClientMonad m => Text -> m ()
id2 x0  = id2' (coerce x0)  where
  id2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Id2Route

{- | Update the color of a label by ID. -}
idcolor :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
idcolor x0 x1  = idcolor' (coerce x0) (coerce x1)  where
  idcolor' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy IdcolorRoute

{- | Update the name of a label by ID. -}
idname :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
idname x0 x1  = idname' (coerce x0) (coerce x1)  where
  idname' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy IdnameRoute

{- | Update an existing board by id -}
idnext :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
idnext x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20  = idnext' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18) (coerce x19) (coerce x20)  where
  idnext' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy IdnextRoute

{- | Create a new list on a board -}
lists1 :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
lists1 x0 x1 x2 x3  = lists1' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  lists1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Lists1Route

{- | Get information about a list -}
listsid :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
listsid x0 x1  = listsid' (coerce x0) (coerce x1)  where
  listsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidRoute

{- | Update the properties of a list -}
listsid1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
listsid1 x0 x1 x2 x3 x4 x5  = listsid1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  listsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Listsid1Route

{- | List the actions on a list -}
listsidactions :: TrelloRESTClientMonad m => Text -> m ()
listsidactions x0  = listsidactions' (coerce x0)  where
  listsidactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidactionsRoute

{- | Archive all cards in a list -}
listsidarchiveallcards :: TrelloRESTClientMonad m => Text -> m ()
listsidarchiveallcards x0  = listsidarchiveallcards' (coerce x0)  where
  listsidarchiveallcards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidarchiveallcardsRoute

{- | Get the board a list is on -}
listsidboard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
listsidboard x0 x1  = listsidboard' (coerce x0) (coerce x1)  where
  listsidboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidboardRoute

{- | List the cards in a list -}
listsidcards :: TrelloRESTClientMonad m => Text -> m ()
listsidcards x0  = listsidcards' (coerce x0)  where
  listsidcards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidcardsRoute

{- | Archive or unarchive a list -}
listsidclosed :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
listsidclosed x0 x1  = listsidclosed' (coerce x0) (coerce x1)  where
  listsidclosed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidclosedRoute

{- | Get a specific property of a list -}
listsidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
listsidfield x0 x1  = listsidfield' (coerce x0) (coerce x1)  where
  listsidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidfieldRoute

{- | Move a list to a new board -}
listsididboard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
listsididboard x0 x1  = listsididboard' (coerce x0) (coerce x1)  where
  listsididboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsididboardRoute

{- | Move all cards in a list -}
listsidmoveallcards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
listsidmoveallcards x0 x1 x2  = listsidmoveallcards' (coerce x0) (coerce x1) (coerce x2)  where
  listsidmoveallcards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidmoveallcardsRoute

{- | Rename a list -}
listsidname :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
listsidname x0 x1  = listsidname' (coerce x0) (coerce x1)  where
  listsidname' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidnameRoute

{- | Change the position of a list -}
listsidpos :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
listsidpos x0 x1  = listsidpos' (coerce x0) (coerce x1)  where
  listsidpos' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidposRoute

{- | Subscribe or unsubscribe from a list -}
listsidsubscribed :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
listsidsubscribed x0 x1  = listsidsubscribed' (coerce x0) (coerce x1)  where
  listsidsubscribed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy ListsidsubscribedRoute

{- | Get a member -}
membersid :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> m ()
membersid x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20  = membersid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18) (coerce x19) (coerce x20)  where
  membersid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidRoute

{- | Update a member -}
membersid1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Int -> m ()
membersid1 x0 x1 x2 x3 x4 x5 x6 x7 x8  = membersid1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8)  where
  membersid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersid1Route

{- | List the actions for a member -}
membersidactions :: TrelloRESTClientMonad m => Text -> m ()
membersidactions x0  = membersidactions' (coerce x0)  where
  membersidactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidactionsRoute

{- | Create a new avatar for a member -}
membersidavatar :: TrelloRESTClientMonad m => Text -> Maybe ByteString -> m ()
membersidavatar x0 x1  = membersidavatar' (coerce x0) (coerce x1)  where
  membersidavatar' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidavatarRoute

{- | Get a member's custom board backgrounds -}
membersidboardbackgrounds :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
membersidboardbackgrounds x0 x1  = membersidboardbackgrounds' (coerce x0) (coerce x1)  where
  membersidboardbackgrounds' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidboardbackgroundsRoute

{- | Upload a new boardBackground -}
membersidboardbackgrounds1 :: TrelloRESTClientMonad m => Text -> Maybe ByteString -> m ()
membersidboardbackgrounds1 x0 x1  = membersidboardbackgrounds1' (coerce x0) (coerce x1)  where
  membersidboardbackgrounds1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidboardbackgrounds1Route

{- | Get a member's board background -}
membersidboardbackgroundsidbackground :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
membersidboardbackgroundsidbackground x0 x1 x2  = membersidboardbackgroundsidbackground' (coerce x0) (coerce x1) (coerce x2)  where
  membersidboardbackgroundsidbackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidboardbackgroundsidbackgroundRoute

{- | Update a board background -}
membersidboardbackgroundsidbackground1 :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Bool -> m ()
membersidboardbackgroundsidbackground1 x0 x1 x2 x3  = membersidboardbackgroundsidbackground1' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  membersidboardbackgroundsidbackground1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidboardbackgroundsidbackground1Route

{- | Delete a board background -}
membersidboardbackgroundsidbackground2 :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidboardbackgroundsidbackground2 x0 x1  = membersidboardbackgroundsidbackground2' (coerce x0) (coerce x1)  where
  membersidboardbackgroundsidbackground2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidboardbackgroundsidbackground2Route

{- | Lists the boards a member has access to -}
membersidboards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
membersidboards x0 x1 x2 x3 x4 x5 x6  = membersidboards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6)  where
  membersidboards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidboardsRoute

{- | Get the boards the member has been invited to -}
membersidboardsinvited :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
membersidboardsinvited x0 x1  = membersidboardsinvited' (coerce x0) (coerce x1)  where
  membersidboardsinvited' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidboardsinvitedRoute

{- | List a member's board stars -}
membersidboardstars :: TrelloRESTClientMonad m => Text -> m ()
membersidboardstars x0  = membersidboardstars' (coerce x0)  where
  membersidboardstars' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidboardstarsRoute

{- | Star a new board -}
membersidboardstars1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
membersidboardstars1 x0 x1 x2  = membersidboardstars1' (coerce x0) (coerce x1) (coerce x2)  where
  membersidboardstars1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidboardstars1Route

{- | Get a specific boardStar -}
membersidboardstarsidstar :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidboardstarsidstar x0 x1  = membersidboardstarsidstar' (coerce x0) (coerce x1)  where
  membersidboardstarsidstar' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidboardstarsidstarRoute

{- | Update the position of a starred board -}
membersidboardstarsidstar1 :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
membersidboardstarsidstar1 x0 x1 x2  = membersidboardstarsidstar1' (coerce x0) (coerce x1) (coerce x2)  where
  membersidboardstarsidstar1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidboardstarsidstar1Route

{- | Unstar a board -}
membersidboardstarsidstar2 :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidboardstarsidstar2 x0 x1  = membersidboardstarsidstar2' (coerce x0) (coerce x1)  where
  membersidboardstarsidstar2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidboardstarsidstar2Route

{- | Gets the cards a member is on -}
membersidcards :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
membersidcards x0 x1  = membersidcards' (coerce x0) (coerce x1)  where
  membersidcards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidcardsRoute

{- | Get a member's custom board backgrounds -}
membersidcustomboardbackgrounds :: TrelloRESTClientMonad m => Text -> m ()
membersidcustomboardbackgrounds x0  = membersidcustomboardbackgrounds' (coerce x0)  where
  membersidcustomboardbackgrounds' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidcustomboardbackgroundsRoute

{- | Upload a new custom board background -}
membersidcustomboardbackgrounds1 :: TrelloRESTClientMonad m => Text -> Maybe ByteString -> m ()
membersidcustomboardbackgrounds1 x0 x1  = membersidcustomboardbackgrounds1' (coerce x0) (coerce x1)  where
  membersidcustomboardbackgrounds1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidcustomboardbackgrounds1Route

{- | Get a specific custom board background -}
membersidcustomboardbackgroundsidbackground :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
membersidcustomboardbackgroundsidbackground x0 x1 x2  = membersidcustomboardbackgroundsidbackground' (coerce x0) (coerce x1) (coerce x2)  where
  membersidcustomboardbackgroundsidbackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidcustomboardbackgroundsidbackgroundRoute

{- | Delete a custom board background -}
membersidcustomboardbackgroundsidbackground1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidcustomboardbackgroundsidbackground1 x0 x1  = membersidcustomboardbackgroundsidbackground1' (coerce x0) (coerce x1)  where
  membersidcustomboardbackgroundsidbackground1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidcustomboardbackgroundsidbackground1Route

{- | Get a member's uploaded custom emoji -}
membersidcustomemoji :: TrelloRESTClientMonad m => Text -> m ()
membersidcustomemoji x0  = membersidcustomemoji' (coerce x0)  where
  membersidcustomemoji' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidcustomemojiRoute

{- | Upload a new custom emoji -}
membersidcustomemoji1 :: TrelloRESTClientMonad m => Text -> Maybe ByteString -> Maybe Text -> m ()
membersidcustomemoji1 x0 x1 x2  = membersidcustomemoji1' (coerce x0) (coerce x1) (coerce x2)  where
  membersidcustomemoji1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidcustomemoji1Route

{- | Get a custom emoji -}
membersidcustomemojiidemoji :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
membersidcustomemojiidemoji x0 x1 x2  = membersidcustomemojiidemoji' (coerce x0) (coerce x1) (coerce x2)  where
  membersidcustomemojiidemoji' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidcustomemojiidemojiRoute

{- | Get a member's uploaded stickers -}
membersidcustomstickers :: TrelloRESTClientMonad m => Text -> m ()
membersidcustomstickers x0  = membersidcustomstickers' (coerce x0)  where
  membersidcustomstickers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidcustomstickersRoute

{- | Upload a new custom sticker -}
membersidcustomstickers1 :: TrelloRESTClientMonad m => Text -> Maybe ByteString -> m ()
membersidcustomstickers1 x0 x1  = membersidcustomstickers1' (coerce x0) (coerce x1)  where
  membersidcustomstickers1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidcustomstickers1Route

{- | Delete a custom sticker -}
membersidcustomstickersidsticker1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidcustomstickersidsticker1 x0 x1  = membersidcustomstickersidsticker1' (coerce x0) (coerce x1)  where
  membersidcustomstickersidsticker1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidcustomstickersidsticker1Route

{- | Get the enterprises that a member belongs to. -}
membersidenterprises :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
membersidenterprises x0 x1 x2  = membersidenterprises' (coerce x0) (coerce x1) (coerce x2)  where
  membersidenterprises' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidenterprisesRoute

{- | Get a particular property of a member -}
membersidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidfield x0 x1  = membersidfield' (coerce x0) (coerce x1)  where
  membersidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidfieldRoute

{- | Get a member's notifications -}
membersidnotifications :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
membersidnotifications x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11  = membersidnotifications' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11)  where
  membersidnotifications' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidnotificationsRoute

{- | Dismiss a message -}
membersidonetimemessagesdismissed :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
membersidonetimemessagesdismissed x0 x1  = membersidonetimemessagesdismissed' (coerce x0) (coerce x1)  where
  membersidonetimemessagesdismissed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidonetimemessagesdismissedRoute

{- | Get a member's teams -}
membersidorganizations :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
membersidorganizations x0 x1 x2 x3  = membersidorganizations' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  membersidorganizations' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidorganizationsRoute

{- | Get a member's teams they have been invited to -}
membersidorganizationsinvited :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
membersidorganizationsinvited x0 x1  = membersidorganizationsinvited' (coerce x0) (coerce x1)  where
  membersidorganizationsinvited' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidorganizationsinvitedRoute

{- | List the saved searches of a member -}
membersidsavedsearches :: TrelloRESTClientMonad m => Text -> m ()
membersidsavedsearches x0  = membersidsavedsearches' (coerce x0)  where
  membersidsavedsearches' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidsavedsearchesRoute

{- | Create a new saved search -}
membersidsavedsearches1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
membersidsavedsearches1 x0 x1 x2 x3  = membersidsavedsearches1' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  membersidsavedsearches1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidsavedsearches1Route

{- | Get a saved search -}
membersidsavedsearchesidsearch :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidsavedsearchesidsearch x0 x1  = membersidsavedsearchesidsearch' (coerce x0) (coerce x1)  where
  membersidsavedsearchesidsearch' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidsavedsearchesidsearchRoute

{- | Update a saved search -}
membersidsavedsearchesidsearch1 :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
membersidsavedsearchesidsearch1 x0 x1 x2 x3 x4  = membersidsavedsearchesidsearch1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  membersidsavedsearchesidsearch1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidsavedsearchesidsearch1Route

{- | Delete a saved search -}
membersidsavedsearchesidsearch2 :: TrelloRESTClientMonad m => Text -> Text -> m ()
membersidsavedsearchesidsearch2 x0 x1  = membersidsavedsearchesidsearch2' (coerce x0) (coerce x1)  where
  membersidsavedsearchesidsearch2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Membersidsavedsearchesidsearch2Route

{- | List a members app tokens -}
membersidtokens :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
membersidtokens x0 x1  = membersidtokens' (coerce x0) (coerce x1)  where
  membersidtokens' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy MembersidtokensRoute

{- | Mark all notifications as read -}
notificationsallread :: TrelloRESTClientMonad m => m ()
notificationsallread  = notificationsallread'  where
  notificationsallread' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsallreadRoute

{- |  -}
notificationsid :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
notificationsid x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14  = notificationsid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14)  where
  notificationsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidRoute

{- | Update the read status of a notification -}
notificationsid1 :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
notificationsid1 x0 x1  = notificationsid1' (coerce x0) (coerce x1)  where
  notificationsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Notificationsid1Route

{- | Get the board a notification is associated with -}
notificationsidboard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
notificationsidboard x0 x1  = notificationsidboard' (coerce x0) (coerce x1)  where
  notificationsidboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidboardRoute

{- | Get the card a notification is associated with -}
notificationsidcard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
notificationsidcard x0 x1  = notificationsidcard' (coerce x0) (coerce x1)  where
  notificationsidcard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidcardRoute

{- | Get a specific property of a notification -}
notificationsidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
notificationsidfield x0 x1  = notificationsidfield' (coerce x0) (coerce x1)  where
  notificationsidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidfieldRoute

{- | Get the list a notification is associated with -}
notificationsidlist :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
notificationsidlist x0 x1  = notificationsidlist' (coerce x0) (coerce x1)  where
  notificationsidlist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidlistRoute

{- | Get the member (not the creator) a notification is about -}
notificationsidmember :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
notificationsidmember x0 x1  = notificationsidmember' (coerce x0) (coerce x1)  where
  notificationsidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidmemberRoute

{- | Get the member who created the notification -}
notificationsidmembercreator :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
notificationsidmembercreator x0 x1  = notificationsidmembercreator' (coerce x0) (coerce x1)  where
  notificationsidmembercreator' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidmembercreatorRoute

{- | Get the organization a notification is associated with -}
notificationsidorganization :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
notificationsidorganization x0 x1  = notificationsidorganization' (coerce x0) (coerce x1)  where
  notificationsidorganization' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidorganizationRoute

{- | Update the read status of a notification -}
notificationsidunread :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
notificationsidunread x0 x1  = notificationsidunread' (coerce x0) (coerce x1)  where
  notificationsidunread' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy NotificationsidunreadRoute

{- | Create a new team -}
organizations1 :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
organizations1 x0 x1 x2 x3  = organizations1' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  organizations1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Organizations1Route

{- |  -}
organizationsid :: TrelloRESTClientMonad m => Text -> m ()
organizationsid x0  = organizationsid' (coerce x0)  where
  organizationsid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidRoute

{- | Update an organization -}
organizationsid1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
organizationsid1 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12  = organizationsid1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12)  where
  organizationsid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Organizationsid1Route

{- | Delete a team -}
organizationsid2 :: TrelloRESTClientMonad m => Text -> m ()
organizationsid2 x0  = organizationsid2' (coerce x0)  where
  organizationsid2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Organizationsid2Route

{- | List the actions on a team -}
organizationsidactions :: TrelloRESTClientMonad m => Text -> m ()
organizationsidactions x0  = organizationsidactions' (coerce x0)  where
  organizationsidactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidactionsRoute

{- | List the boards in a team -}
organizationsidboards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
organizationsidboards x0 x1 x2  = organizationsidboards' (coerce x0) (coerce x1) (coerce x2)  where
  organizationsidboards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidboardsRoute

{- |  -}
organizationsidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
organizationsidfield x0 x1  = organizationsidfield' (coerce x0) (coerce x1)  where
  organizationsidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidfieldRoute

{- | Set the logo image for a team -}
organizationsidlogo :: TrelloRESTClientMonad m => Text -> Maybe ByteString -> m ()
organizationsidlogo x0 x1  = organizationsidlogo' (coerce x0) (coerce x1)  where
  organizationsidlogo' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidlogoRoute

{- | Delete a the logo from a team -}
organizationsidlogo1 :: TrelloRESTClientMonad m => Text -> m ()
organizationsidlogo1 x0  = organizationsidlogo1' (coerce x0)  where
  organizationsidlogo1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Organizationsidlogo1Route

{- | List the members in a team -}
organizationsidmembers :: TrelloRESTClientMonad m => Text -> m ()
organizationsidmembers x0  = organizationsidmembers' (coerce x0)  where
  organizationsidmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembersRoute

{- |  -}
organizationsidmembers1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
organizationsidmembers1 x0 x1 x2 x3  = organizationsidmembers1' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  organizationsidmembers1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Organizationsidmembers1Route

{- |  -}
organizationsidmembersfilter :: TrelloRESTClientMonad m => Text -> Text -> m ()
organizationsidmembersfilter x0 x1  = organizationsidmembersfilter' (coerce x0) (coerce x1)  where
  organizationsidmembersfilter' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembersfilterRoute

{- | List the memberships of a team -}
organizationsidmemberships :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> m ()
organizationsidmemberships x0 x1 x2  = organizationsidmemberships' (coerce x0) (coerce x1) (coerce x2)  where
  organizationsidmemberships' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembershipsRoute

{- | List the memberships of a team -}
organizationsidmembershipsidmembership :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> m ()
organizationsidmembershipsidmembership x0 x1 x2  = organizationsidmembershipsidmembership' (coerce x0) (coerce x1) (coerce x2)  where
  organizationsidmembershipsidmembership' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembershipsidmembershipRoute

{- | Add a member to a team or update their member type. -}
organizationsidmembersidmember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
organizationsidmembersidmember x0 x1 x2  = organizationsidmembersidmember' (coerce x0) (coerce x1) (coerce x2)  where
  organizationsidmembersidmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembersidmemberRoute

{- | Remove a member from a team -}
organizationsidmembersidmember1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
organizationsidmembersidmember1 x0 x1  = organizationsidmembersidmember1' (coerce x0) (coerce x1)  where
  organizationsidmembersidmember1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Organizationsidmembersidmember1Route

{- | Remove a member from a team and from all team boards -}
organizationsidmembersidmemberall :: TrelloRESTClientMonad m => Text -> Text -> m ()
organizationsidmembersidmemberall x0 x1  = organizationsidmembersidmemberall' (coerce x0) (coerce x1)  where
  organizationsidmembersidmemberall' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembersidmemberallRoute

{- | Deactivate or reactivate a member of a team -}
organizationsidmembersidmemberdeactivated :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> m ()
organizationsidmembersidmemberdeactivated x0 x1 x2  = organizationsidmembersidmemberdeactivated' (coerce x0) (coerce x1) (coerce x2)  where
  organizationsidmembersidmemberdeactivated' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembersidmemberdeactivatedRoute

{- | List the members with pending invites to a team -}
organizationsidmembersinvited :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
organizationsidmembersinvited x0 x1  = organizationsidmembersinvited' (coerce x0) (coerce x1)  where
  organizationsidmembersinvited' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidmembersinvitedRoute

{- | Used to check whether the given board has new billable guests on it. -}
organizationsidnewbillableguestsidboard :: TrelloRESTClientMonad m => Text -> Text -> m ()
organizationsidnewbillableguestsidboard x0 x1  = organizationsidnewbillableguestsidboard' (coerce x0) (coerce x1)  where
  organizationsidnewbillableguestsidboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidnewbillableguestsidboardRoute

{- | Get organization scoped pluginData on this team -}
organizationsidplugindata :: TrelloRESTClientMonad m => Text -> m ()
organizationsidplugindata x0  = organizationsidplugindata' (coerce x0)  where
  organizationsidplugindata' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidplugindataRoute

{- | Remove the associated Google Apps domain from a team -}
organizationsidprefsassociateddomain :: TrelloRESTClientMonad m => Text -> m ()
organizationsidprefsassociateddomain x0  = organizationsidprefsassociateddomain' (coerce x0)  where
  organizationsidprefsassociateddomain' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidprefsassociateddomainRoute

{- | Remove the email domain restriction on who can be invited to the team -}
organizationsidprefsorginviterestrict :: TrelloRESTClientMonad m => Text -> m ()
organizationsidprefsorginviterestrict x0  = organizationsidprefsorginviterestrict' (coerce x0)  where
  organizationsidprefsorginviterestrict' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidprefsorginviterestrictRoute

{- | List the organization's collections -}
organizationsidtags :: TrelloRESTClientMonad m => Text -> m ()
organizationsidtags x0  = organizationsidtags' (coerce x0)  where
  organizationsidtags' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidtagsRoute

{- | Create a new collection in a team -}
organizationsidtags1 :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
organizationsidtags1 x0 x1  = organizationsidtags1' (coerce x0) (coerce x1)  where
  organizationsidtags1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Organizationsidtags1Route

{- | Delete an organization's tag -}
organizationsidtagsidtag :: TrelloRESTClientMonad m => Text -> Text -> m ()
organizationsidtagsidtag x0 x1  = organizationsidtagsidtag' (coerce x0) (coerce x1)  where
  organizationsidtagsidtag' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy OrganizationsidtagsidtagRoute

{- | Create a new label on a board. -}
page1 :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> m ()
page1 x0 x1 x2  = page1' (coerce x0) (coerce x1) (coerce x2)  where
  page1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Page1Route

{- |  -}
putMembersidcustomboardbackgroundsidbackground :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Bool -> m ()
putMembersidcustomboardbackgroundsidbackground x0 x1 x2 x3  = putMembersidcustomboardbackgroundsidbackground' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  putMembersidcustomboardbackgroundsidbackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutMembersidcustomboardbackgroundsidbackgroundRoute

{- | Find what you're looking for in Trello -}
search1 :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Text -> Maybe Int -> Maybe Int -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Text -> Maybe Int -> Maybe Bool -> m ()
search1 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19  = search1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18) (coerce x19)  where
  search1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Search1Route

{- | Search for Trello members -}
searchmembers :: TrelloRESTClientMonad m => Maybe Text -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
searchmembers x0 x1 x2 x3 x4  = searchmembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  searchmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy SearchmembersRoute

{- | Retrieve information about a token. -}
tokenstoken :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> m ()
tokenstoken x0 x1 x2  = tokenstoken' (coerce x0) (coerce x1) (coerce x2)  where
  tokenstoken' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy TokenstokenRoute

{- | Delete a token. -}
tokenstoken1 :: TrelloRESTClientMonad m => Text -> m ()
tokenstoken1 x0  = tokenstoken1' (coerce x0)  where
  tokenstoken1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Tokenstoken1Route

{- | Retrieve information about a token's owner by token. -}
tokenstokenmember :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
tokenstokenmember x0 x1  = tokenstokenmember' (coerce x0) (coerce x1)  where
  tokenstokenmember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy TokenstokenmemberRoute

{- | Retrieve all webhooks created with a token. -}
tokenstokenwebhooks :: TrelloRESTClientMonad m => Text -> m ()
tokenstokenwebhooks x0  = tokenstokenwebhooks' (coerce x0)  where
  tokenstokenwebhooks' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy TokenstokenwebhooksRoute

{- | Update an existing webhook. -}
tokenstokenwebhooks1 :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
tokenstokenwebhooks1 x0 x1 x2 x3 x4  = tokenstokenwebhooks1' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  tokenstokenwebhooks1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Tokenstokenwebhooks1Route

{- | Create a new webhook for a token. -}
tokenstokenwebhooks2 :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
tokenstokenwebhooks2 x0 x1 x2 x3  = tokenstokenwebhooks2' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  tokenstokenwebhooks2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Tokenstokenwebhooks2Route

{- | Retrieve a webhook created with a token. -}
tokenstokenwebhooksidwebhook :: TrelloRESTClientMonad m => Text -> Text -> m ()
tokenstokenwebhooksidwebhook x0 x1  = tokenstokenwebhooksidwebhook' (coerce x0) (coerce x1)  where
  tokenstokenwebhooksidwebhook' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy TokenstokenwebhooksidwebhookRoute

{- | Delete a webhook created with given token. -}
tokenstokenwebhooksidwebhook1 :: TrelloRESTClientMonad m => Text -> Text -> m ()
tokenstokenwebhooksidwebhook1 x0 x1  = tokenstokenwebhooksidwebhook1' (coerce x0) (coerce x1)  where
  tokenstokenwebhooksidwebhook1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Tokenstokenwebhooksidwebhook1Route

{- | Get a webhook by ID. -}
webhookObject1 :: TrelloRESTClientMonad m => Text -> m ()
webhookObject1 x0  = webhookObject1' (coerce x0)  where
  webhookObject1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy WebhookObject1Route

{- | Create a new webhook. -}
webhooks2 :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
webhooks2 x0 x1 x2 x3  = webhooks2' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  webhooks2' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Webhooks2Route

{- | Update a webhook by ID. -}
webhooksid :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
webhooksid x0 x1 x2 x3 x4  = webhooksid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  webhooksid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy WebhooksidRoute

{- | Delete a webhook by ID. -}
webhooksid1 :: TrelloRESTClientMonad m => Text -> m ()
webhooksid1 x0  = webhooksid1' (coerce x0)  where
  webhooksid1' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy Webhooksid1Route

{- | Get a webhook's field. -}
webhooksidfield :: TrelloRESTClientMonad m => Text -> Text -> m ()
webhooksidfield x0 x1  = webhooksidfield' (coerce x0) (coerce x1)  where
  webhooksidfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy WebhooksidfieldRoute



