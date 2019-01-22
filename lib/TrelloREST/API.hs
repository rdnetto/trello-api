{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-unused-imports -freduction-depth=0 #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module TrelloREST.API where

import TrelloREST.Common
import TrelloREST.Types

import qualified Data.Map as Map
import qualified Data.Text as T
import GHC.Generics (Generic)
import Prelude
import Servant.API
import Servant.API.Verbs (StdMethod(..), Verb)
import Web.Internal.FormUrlEncoded (ToForm(..), FromForm(..), parseUnique)

import Data.ByteString (ByteString)
import Data.Time.Calendar (Day)
import Data.Text (Text)




-- | Servant type-level API, generated from the Swagger spec for TrelloREST.
type ActionsactionidRoute
  =  "actions"
  :> Capture "id" Text
  :> QueryParam "display" Bool
  :> QueryParam "entities" Bool
  :> QueryParam "fields" Text
  :> QueryParam "member" Bool
  :> QueryParam "member_fields" Text
  :> QueryParam "memberCreator" Bool
  :> QueryParam "memberCreator_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsidRoute
  =  "actions"
  :> Capture "id" Text
  :> QueryParam "text" Text
  :> Verb 'PUT 200 '[JSON] ()

type Actionsid1Route
  =  "actions"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type ActionsidactionreactionsRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> QueryParam "member" Bool
  :> QueryParam "emoji" Bool
  :> Verb 'GET 200 '[JSON] ()

type Actionsidactionreactions1Route
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> ReqBody '[JSON] Body_1
  :> Verb 'POST 200 '[JSON] ()

type ActionsidactionreactionsidRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> Capture "id" Text
  :> QueryParam "member" Bool
  :> QueryParam "emoji" Bool
  :> Verb 'GET 200 '[JSON] ()

type Actionsidactionreactionsid1Route
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type ActionsidactionreactionssummaryRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactionsSummary"
  :> Verb 'GET 200 '[JSON] ()

type ActionsidboardRoute
  =  "actions"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsidcardRoute
  =  "actions"
  :> Capture "id" Text
  :> "card"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsiddisplayRoute
  =  "actions"
  :> Capture "id" Text
  :> "display"
  :> Verb 'GET 200 '[JSON] ()

type ActionsidfieldRoute
  =  "actions"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsidlistRoute
  =  "actions"
  :> Capture "id" Text
  :> "list"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsidmemberRoute
  =  "actions"
  :> Capture "id" Text
  :> "member"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsidmembercreatorRoute
  =  "actions"
  :> Capture "id" Text
  :> "memberCreator"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsidorganizationRoute
  =  "actions"
  :> Capture "id" Text
  :> "organization"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ActionsidtextRoute
  =  "actions"
  :> Capture "id" Text
  :> "text"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type Batch1Route
  =  "batch"
  :> QueryParam "urls" Text
  :> Verb 'GET 200 '[JSON] ()

type BoardsNestedResourcesRoute
  =  "boards"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type Boardsboardid1Route
  =  "boards"
  :> Capture "id" Text
  :> QueryParam "actions" Text
  :> QueryParam "boardStars" Text
  :> QueryParam "cards" Text
  :> QueryParam "card_pluginData" Bool
  :> QueryParam "checklists" Text
  :> QueryParam "customFields" Bool
  :> QueryParam "fields" Text
  :> QueryParam "labels" Text
  :> QueryParam "lists" Text
  :> QueryParam "members" Text
  :> QueryParam "memberships" Text
  :> QueryParam "membersInvited" Text
  :> QueryParam "membersInvited_fields" Text
  :> QueryParam "pluginData" Bool
  :> QueryParam "organization" Bool
  :> QueryParam "organization_pluginData" Bool
  :> QueryParam "myPrefs" Bool
  :> QueryParam "tags" Bool
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardidactionsRoute
  =  "boards"
  :> Capture "boardId" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type Boardsboardidactions1Route
  =  "boards"
  :> Capture "id" Text
  :> "cards"
  :> Capture "idCard" Text
  :> Verb 'GET 200 '[JSON] ()

type Boardsboardidactions2Route
  =  "boards"
  :> Capture "boardId" Text
  :> "boardStars"
  :> Verb 'GET 200 '[JSON] ()

type Boardsboardidactions3Route
  =  "boards"
  :> Capture "id" Text
  :> "checklists"
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardidcardsfilterRoute
  =  "boards"
  :> Capture "boardId" Text
  :> "cards"
  :> Capture "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardididtagsRoute
  =  "boards"
  :> Capture "id" Text
  :> "tags"
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardidlabelsRoute
  =  "boards"
  :> Capture "id" Text
  :> "labels"
  :> QueryParam "fields" Text
  :> QueryParam "limit" Int
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardidlistsRoute
  =  "boards"
  :> Capture "id" Text
  :> "lists"
  :> QueryParam "cards" Text
  :> QueryParam "card_fields" Text
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardidlistsfilterRoute
  =  "boards"
  :> Capture "id" Text
  :> "lists"
  :> Capture "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardidmembersRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> Verb 'GET 200 '[JSON] ()

type BoardsboardidtestRoute
  =  "boards"
  :> Capture "id" Text
  :> "cards"
  :> Verb 'GET 200 '[JSON] ()

type BoardsidRoute
  =  "boards"
  :> QueryParam "name" Text
  :> QueryParam "defaultLabels" Bool
  :> QueryParam "defaultLists" Bool
  :> QueryParam "desc" Text
  :> QueryParam "idOrganization" Text
  :> QueryParam "idBoardSource" Text
  :> QueryParam "keepFromSource" Text
  :> QueryParam "powerUps" Text
  :> QueryParam "prefs_permissionLevel" Text
  :> QueryParam "prefs_voting" Text
  :> QueryParam "prefs_comments" Text
  :> QueryParam "prefs_invitations" Text
  :> QueryParam "prefs_selfJoin" Bool
  :> QueryParam "prefs_cardCovers" Bool
  :> QueryParam "prefs_background" Text
  :> QueryParam "prefs_cardAging" Text
  :> Verb 'POST 200 '[JSON] ()

type Boardsid1Route
  =  "boards"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type BoardsidboardpluginsRoute
  =  "boards"
  :> Capture "id" Text
  :> "boardPlugins"
  :> Verb 'GET 200 '[JSON] ()

type Boardsidboardplugins1Route
  =  "boards"
  :> Capture "id" Text
  :> "boardPlugins"
  :> QueryParam "idPlugin" Text
  :> Verb 'POST 200 '[JSON] ()

type Boardsidboardplugins2Route
  =  "boards"
  :> Capture "id" Text
  :> "boardPlugins"
  :> Capture "idPlugin" Text
  :> Verb 'DELETE 200 '[JSON] ()

type BoardsidcalendarkeygenerateRoute
  =  "boards"
  :> Capture "id" Text
  :> "calendarKey"
  :> "generate"
  :> Verb 'POST 200 '[JSON] ()

type BoardsidcustomfieldsRoute
  =  "boards"
  :> Capture "id" Text
  :> "customFields"
  :> Verb 'GET 200 '[JSON] ()

type BoardsidemailkeygenerateRoute
  =  "boards"
  :> Capture "id" Text
  :> "emailKey"
  :> "generate"
  :> Verb 'POST 200 '[JSON] ()

type BoardsididtagsRoute
  =  "boards"
  :> Capture "id" Text
  :> "idTags"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type BoardsidlabelnamesmembersRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> QueryParam "email" Text
  :> ReqBody '[JSON] Body_2
  :> Header "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidlabelnamesmembershipsidmembershipRoute
  =  "boards"
  :> Capture "id" Text
  :> "memberships"
  :> Capture "idMembership" Text
  :> QueryParam "type" Text
  :> QueryParam "member_fields" Text
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidlabelnamesmembersidmemberRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> QueryParam "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidlabelsRoute
  =  "boards"
  :> Capture "id" Text
  :> "labels"
  :> QueryParam "name" Text
  :> QueryParam "color" Text
  :> Verb 'POST 200 '[JSON] ()

type BoardsidlistsRoute
  =  "boards"
  :> Capture "id" Text
  :> "lists"
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type BoardsidmarkedasviewedRoute
  =  "boards"
  :> Capture "id" Text
  :> "checklists"
  :> Verb 'POST 200 '[JSON] ()

type BoardsidmembershipsRoute
  =  "boards"
  :> Capture "id" Text
  :> "memberships"
  :> QueryParam "filter" Text
  :> QueryParam "activity" Bool
  :> QueryParam "orgMemberType" Bool
  :> QueryParam "member" Bool
  :> QueryParam "member_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type BoardsidmembersidmemberRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type BoardsidmyprefsemailpositionRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "emailPosition"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidmyprefsidemaillistRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "idEmailList"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidmyprefsshowlistguideRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showListGuide"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidmyprefsshowsidebaeRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebar"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidmyprefsshowsidebaractivityRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebarActivity"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidmyprefsshowsidebarboardactionsRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebarBoardActions"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidmyprefsshowsidebarmembersRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebarMembers"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type BoardsidpluginsRoute
  =  "boards"
  :> Capture "id" Text
  :> "plugins"
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type BoardsidpowerupsRoute
  =  "boards"
  :> Capture "id" Text
  :> "powerUps"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type BoardsidpowerupspowerupRoute
  =  "boards"
  :> Capture "id" Text
  :> "powerUps"
  :> Capture "powerUp" Text
  :> Verb 'DELETE 200 '[JSON] ()

type Cards2Route
  =  "cards"
  :> QueryParam "name" Text
  :> QueryParam "desc" Text
  :> QueryParam "pos" Text
  :> QueryParam "due" Day
  :> QueryParam "dueComplete" Bool
  :> QueryParam "idList" Text
  :> QueryParam "idMembers" Text
  :> QueryParam "idLabels" Text
  :> QueryParam "urlSource" Text
  :> QueryParam "fileSource" ByteString
  :> QueryParam "idCardSource" Text
  :> QueryParam "keepFromSource" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsidRoute
  =  "cards"
  :> Capture "id" Text
  :> QueryParam "fields" Text
  :> QueryParam "actions" Text
  :> QueryParam "attachments" Text
  :> QueryParam "attachment_fields" Text
  :> QueryParam "members" Bool
  :> QueryParam "member_fields" Text
  :> QueryParam "membersVoted" Bool
  :> QueryParam "memberVoted_fields" Text
  :> QueryParam "checkItemStates" Bool
  :> QueryParam "checklists" Text
  :> QueryParam "checklist_fields" Text
  :> QueryParam "board" Bool
  :> QueryParam "board_fields" Text
  :> QueryParam "list" Bool
  :> QueryParam "pluginData" Bool
  :> QueryParam "stickers" Bool
  :> QueryParam "sticker_fields" Text
  :> QueryParam "customFieldItems" Bool
  :> Verb 'GET 200 '[JSON] ()

type Cardsid1Route
  =  "cards"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "desc" Text
  :> QueryParam "closed" Bool
  :> QueryParam "idMembers" Text
  :> QueryParam "idAttachmentCover" Text
  :> QueryParam "idList" Text
  :> QueryParam "idLabels" Text
  :> QueryParam "idBoard" Text
  :> QueryParam "pos" Text
  :> QueryParam "due" Day
  :> QueryParam "dueComplete" Bool
  :> QueryParam "subscribed" Bool
  :> Verb 'PUT 200 '[JSON] ()

type CardsidactionsRoute
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type CardsidactionscommentsRoute
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> "comments"
  :> QueryParam "text" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsidactionsidactioncommentsRoute
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> Capture "idAction" Text
  :> "comments"
  :> QueryParam "text" Text
  :> Verb 'PUT 200 '[JSON] ()

type Cardsidactionsidactioncomments1Route
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> Capture "idAction" Text
  :> "comments"
  :> Verb 'DELETE 200 '[JSON] ()

type CardsidattachmentsRoute
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> Verb 'GET 200 '[JSON] ()

type Cardsidattachments1Route
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> QueryParam "name" Text
  :> QueryParam "file" ByteString
  :> QueryParam "mimeType" Text
  :> QueryParam "url" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsidattachmentsidattachmentRoute
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> Capture "idAttachment" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Cardsidattachmentsidattachment1Route
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> Capture "idAttachment" Text
  :> Verb 'DELETE 200 '[JSON] ()

type CardsidboardRoute
  =  "cards"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type CardsidcardchecklistidchecklistcheckitemidcheckitemRoute
  =  "cards"
  :> Capture "idCard" Text
  :> "checklist"
  :> Capture "idChecklist" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type CardsidcheckitemidcheckitemRoute
  =  "cards"
  :> Capture "id" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Cardsidcheckitemidcheckitem1Route
  =  "cards"
  :> Capture "id" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> QueryParam "name" Text
  :> QueryParam "state" Text
  :> QueryParam "idChecklist" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type Cardsidcheckitemidcheckitem2Route
  =  "cards"
  :> Capture "id" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> Verb 'DELETE 200 '[JSON] ()

type CardsidcheckitemstatesRoute
  =  "cards"
  :> Capture "id" Text
  :> "checkItemStates"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type CardsidchecklistsRoute
  =  "cards"
  :> Capture "id" Text
  :> "checklists"
  :> QueryParam "checkItems" Text
  :> QueryParam "checkItem_fields" Text
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Cardsidchecklists1Route
  =  "cards"
  :> Capture "id" Text
  :> "checklists"
  :> QueryParam "name" Text
  :> QueryParam "idChecklistSource" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsidchecklistsidchecklistRoute
  =  "cards"
  :> Capture "id" Text
  :> "checklists"
  :> Capture "idChecklist" Text
  :> Verb 'DELETE 200 '[JSON] ()

type CardsidcustomfielditemsRoute
  =  "cards"
  :> Capture "id" Text
  :> "customFieldItems"
  :> Verb 'GET 200 '[JSON] ()

type CardsidfieldRoute
  =  "cards"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type CardsididlabelsRoute
  =  "cards"
  :> Capture "id" Text
  :> "idLabels"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsididlabelsidlabelRoute
  =  "cards"
  :> Capture "id" Text
  :> "idLabels"
  :> Capture "idLabel" Text
  :> Verb 'DELETE 200 '[JSON] ()

type CardsididmembersRoute
  =  "cards"
  :> Capture "id" Text
  :> "idMembers"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsididmembersidmemberRoute
  =  "cards"
  :> Capture "id" Text
  :> "idMembers"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type CardsidlabelsRoute
  =  "cards"
  :> Capture "id" Text
  :> "labels"
  :> QueryParam "color" Text
  :> QueryParam "name" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsidlistRoute
  =  "cards"
  :> Capture "id" Text
  :> "list"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type CardsidmarkassociatednotificationsreadRoute
  =  "cards"
  :> Capture "id" Text
  :> "markAssociatedNotificationsRead"
  :> Verb 'POST 200 '[JSON] ()

type CardsidmembersRoute
  =  "cards"
  :> Capture "id" Text
  :> "members"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type CardsidmembersvotedRoute
  =  "cards"
  :> Capture "id" Text
  :> "membersVoted"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Cardsidmembersvoted1Route
  =  "cards"
  :> Capture "id" Text
  :> "membersVoted"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type CardsidmembersvotedidmemberRoute
  =  "cards"
  :> Capture "id" Text
  :> "membersVoted"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type CardsidplugindataRoute
  =  "cards"
  :> Capture "id" Text
  :> "pluginData"
  :> Verb 'GET 200 '[JSON] ()

type CardsidstickersRoute
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type CardsidstickersidstickerRoute
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> Capture "idSticker" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Cardsidstickersidsticker1Route
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> Capture "idSticker" Text
  :> Verb 'DELETE 200 '[JSON] ()

type Cardsidstickersidsticker2Route
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> Capture "idSticker" Text
  :> QueryParam "top" Float
  :> QueryParam "left" Float
  :> QueryParam "zIndex" Int
  :> QueryParam "rotate" Float
  :> Verb 'PUT 200 '[JSON] ()

type ChecklistsRoute
  =  "checklists"
  :> QueryParam "idCard" Text
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> QueryParam "idChecklistSource" Text
  :> Verb 'POST 200 '[JSON] ()

type ChecklistsidRoute
  =  "checklists"
  :> Capture "id" Text
  :> QueryParam "cards" Text
  :> QueryParam "checkItems" Text
  :> QueryParam "checkItem_fields" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Checklistsid1Route
  =  "checklists"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type Checklistsid2Route
  =  "checklists"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type ChecklistsidboardRoute
  =  "checklists"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ChecklistsidcardsRoute
  =  "checklists"
  :> Capture "id" Text
  :> "cards"
  :> Verb 'GET 200 '[JSON] ()

type ChecklistsidcardscheckitemsRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ChecklistsidcardscheckitemscheckitemidRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> Capture "idCheckItem" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ChecklistsidcheckitemsRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> QueryParam "checked" Bool
  :> Verb 'POST 200 '[JSON] ()

type ChecklistsidcheckitemsidRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> Capture "idCheckItem" Text
  :> Verb 'DELETE 200 '[JSON] ()

type ChecklistsidcheckitemsidcheckitemRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> Capture "idCheckItem" Text
  :> QueryParam "pos" Int
  :> Verb 'PUT 200 '[JSON] ()

type ChecklistsidfieldRoute
  =  "checklists"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type ChecklistsidnameRoute
  =  "checklists"
  :> Capture "id" Text
  :> "name"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type CustomfielditemsidRoute
  =  "card"
  :> Capture "idCard" Text
  :> "customField"
  :> Capture "idCustomField" Text
  :> "item"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type CustomfieldsRoute
  =  "customFields"
  :> ReqBody '[JSON] Body
  :> Verb 'POST 200 '[JSON] ()

type CustomfieldsidRoute
  =  "customfields"
  :> Capture "id" Text
  :> ReqBody '[JSON] Body_3
  :> Verb 'PUT 200 '[JSON] ()

type Customfieldsid1Route
  =  "customfields"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type Customfieldsid3Route
  =  "customfields"
  :> Capture "id" Text
  :> Verb 'GET 200 '[JSON] ()

type Customfieldsidoptions1Route
  =  "customFields"
  :> Capture "id" Text
  :> "options"
  :> Verb 'GET 200 '[JSON] ()

type Customfieldsidoptions2Route
  =  "customFields"
  :> Capture "id" Text
  :> "options"
  :> Verb 'POST 200 '[JSON] ()

type Customfieldsidoptionsidcustomfieldoption1Route
  =  "customfields"
  :> Capture "id" Text
  :> "options"
  :> Capture "idCustomFieldOption" Text
  :> Verb 'DELETE 200 '[JSON] ()

type Customfieldsidoptionsidcustomfieldoption3Route
  =  "customFields"
  :> Capture "id" Text
  :> "options"
  :> Capture "idCustomFieldOption" Text
  :> Verb 'GET 200 '[JSON] ()

type DeleteCardRoute
  =  "cards"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type EmojiRoute
  =  "emoji"
  :> QueryParam "locale" Text
  :> QueryParam "spritesheets" Bool
  :> Verb 'GET 200 '[JSON] ()

type EnterprisesidRoute
  =  "enterprises"
  :> Capture "id" Text
  :> QueryParam "fields" Text
  :> QueryParam "members" Text
  :> QueryParam "member_fields" Text
  :> QueryParam "member_filter" Text
  :> QueryParam "member_sort" Text
  :> QueryParam "member_sortBy" Text
  :> QueryParam "member_sortOrder" Text
  :> QueryParam "member_startIndex" Int
  :> QueryParam "member_count" Int
  :> QueryParam "organizations" Text
  :> QueryParam "organization_fields" Text
  :> QueryParam "organization_paid_accounts" Bool
  :> QueryParam "organization_memberships" Text
  :> Verb 'GET 200 '[JSON] ()

type EnterprisesidadminsRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "admins"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type EnterprisesidadminsidmemberRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "organizations"
  :> QueryParam "idOrganization" Text
  :> Verb 'PUT 200 '[JSON] ()

type Enterprisesidadminsidmember1Route
  =  "enterprises"
  :> Capture "id" Text
  :> "admins"
  :> Capture "idMember" Text
  :> Verb 'PUT 200 '[JSON] ()

type Enterprisesidadminsidmember2Route
  =  "enterprises"
  :> Capture "id" Text
  :> "organizations"
  :> Capture "idOrganization" Text
  :> Verb 'DELETE 200 '[JSON] ()

type EnterprisesidmembersRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "members"
  :> QueryParam "fields" Text
  :> QueryParam "filter" Text
  :> QueryParam "sort" Text
  :> QueryParam "sortBy" Text
  :> QueryParam "sortOrder" Text
  :> QueryParam "startIndex" Int
  :> QueryParam "count" Text
  :> QueryParam "organization_fields" Text
  :> QueryParam "board_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type EnterprisesidmembersidmemberRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> QueryParam "fields" Text
  :> QueryParam "organization_fields" Text
  :> QueryParam "board_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Enterprisesidmembersidmemberdeactivated1Route
  =  "enterprises"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> "deactivated"
  :> QueryParam "value" Bool
  :> QueryParam "fields" Text
  :> QueryParam "organization_fields" Text
  :> QueryParam "board_fields" Text
  :> Verb 'PUT 200 '[JSON] ()

type EnterprisesidsignupurlRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "signupUrl"
  :> QueryParam "authenticate" Bool
  :> QueryParam "confirmationAccepted" Bool
  :> QueryParam "returnUrl" Text
  :> QueryParam "tosAccepted" Bool
  :> Verb 'GET 200 '[JSON] ()

type EnterprisesidtokensRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "tokens"
  :> QueryParam "expiration" Text
  :> Verb 'POST 200 '[JSON] ()

type EnterprisesidtransferrableorganizationidorganizationRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "transferrable"
  :> "organization"
  :> Capture "idOrganization" Text
  :> Verb 'GET 200 '[JSON] ()

type IdRoute
  =  "labels"
  :> Capture "id" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Id1Route
  =  "labels"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "color" Text
  :> Verb 'PUT 200 '[JSON] ()

type Id2Route
  =  "labels"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type IdcolorRoute
  =  "labels"
  :> Capture "id" Text
  :> "color"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type IdnameRoute
  =  "labels"
  :> Capture "id" Text
  :> "name"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type IdnextRoute
  =  "boards"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "desc" Text
  :> QueryParam "closed" Bool
  :> QueryParam "subscribed" Bool
  :> QueryParam "idOrganization" Text
  :> QueryParam "prefs/permissionLevel" Text
  :> QueryParam "prefs/selfJoin" Bool
  :> QueryParam "prefs/cardCovers" Bool
  :> QueryParam "prefs/invitations" Text
  :> QueryParam "prefs/voting" Text
  :> QueryParam "prefs/comments" Text
  :> QueryParam "prefs/background" Text
  :> QueryParam "prefs/cardAging" Text
  :> QueryParam "prefs/calendarFeedEnabled" Bool
  :> QueryParam "labelNames/green" Text
  :> QueryParam "labelNames/yellow" Text
  :> QueryParam "labelNames/orange" Text
  :> QueryParam "labelNames/red" Text
  :> QueryParam "labelNames/purple" Text
  :> QueryParam "labelNames/blue" Text
  :> Verb 'PUT 200 '[JSON] ()

type Lists1Route
  =  "lists"
  :> QueryParam "name" Text
  :> QueryParam "idBoard" Text
  :> QueryParam "idListSource" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type ListsidRoute
  =  "lists"
  :> Capture "id" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Listsid1Route
  =  "lists"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "closed" Bool
  :> QueryParam "idBoard" Text
  :> QueryParam "pos" Text
  :> QueryParam "subscribed" Bool
  :> Verb 'PUT 200 '[JSON] ()

type ListsidactionsRoute
  =  "lists"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type ListsidarchiveallcardsRoute
  =  "lists"
  :> Capture "id" Text
  :> "archiveAllCards"
  :> Verb 'POST 200 '[JSON] ()

type ListsidboardRoute
  =  "lists"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type ListsidcardsRoute
  =  "lists"
  :> Capture "id" Text
  :> "cards"
  :> Verb 'GET 200 '[JSON] ()

type ListsidclosedRoute
  =  "lists"
  :> Capture "id" Text
  :> "closed"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type ListsidfieldRoute
  =  "lists"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type ListsididboardRoute
  =  "lists"
  :> Capture "id" Text
  :> "idBoard"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type ListsidmoveallcardsRoute
  =  "lists"
  :> Capture "id" Text
  :> "moveAllCards"
  :> QueryParam "idBoard" Text
  :> QueryParam "idList" Text
  :> Verb 'POST 200 '[JSON] ()

type ListsidnameRoute
  =  "lists"
  :> Capture "id" Text
  :> "name"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type ListsidposRoute
  =  "lists"
  :> Capture "id" Text
  :> "pos"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type ListsidsubscribedRoute
  =  "lists"
  :> Capture "id" Text
  :> "subscribed"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type MembersidRoute
  =  "members"
  :> Capture "id" Text
  :> QueryParam "actions" Text
  :> QueryParam "boards" Text
  :> QueryParam "boardBackgrounds" Text
  :> QueryParam "boardsInvited" Text
  :> QueryParam "boardsInvited_fields" Text
  :> QueryParam "boardStars" Bool
  :> QueryParam "cards" Text
  :> QueryParam "customBoardBackgrounds" Text
  :> QueryParam "customEmoji" Text
  :> QueryParam "customStickers" Text
  :> QueryParam "fields" Text
  :> QueryParam "notifications" Text
  :> QueryParam "organizations" Text
  :> QueryParam "organization_fields" Text
  :> QueryParam "organization_paid_account" Bool
  :> QueryParam "organizationsInvited" Text
  :> QueryParam "organizationsInvited_fields" Text
  :> QueryParam "paid_account" Bool
  :> QueryParam "savedSearches" Bool
  :> QueryParam "tokens" Text
  :> Verb 'GET 200 '[JSON] ()

type Membersid1Route
  =  "members"
  :> Capture "id" Text
  :> QueryParam "fullName" Text
  :> QueryParam "initials" Text
  :> QueryParam "username" Text
  :> QueryParam "bio" Text
  :> QueryParam "avatarSource" Text
  :> QueryParam "prefs/colorBlind" Bool
  :> QueryParam "prefs/locale" Text
  :> QueryParam "prefs/minutesBetweenSummaries" Int
  :> Verb 'PUT 200 '[JSON] ()

type MembersidactionsRoute
  =  "members"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type MembersidavatarRoute
  =  "members"
  :> Capture "id" Text
  :> "avatar"
  :> QueryParam "file" ByteString
  :> Verb 'POST 200 '[JSON] ()

type MembersidboardbackgroundsRoute
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type Membersidboardbackgrounds1Route
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> QueryParam "file" ByteString
  :> Verb 'POST 200 '[JSON] ()

type MembersidboardbackgroundsidbackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Membersidboardbackgroundsidbackground1Route
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "brightness" Text
  :> QueryParam "tile" Bool
  :> Verb 'PUT 200 '[JSON] ()

type Membersidboardbackgroundsidbackground2Route
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> Capture "idBackground" Text
  :> Verb 'DELETE 200 '[JSON] ()

type MembersidboardsRoute
  =  "members"
  :> Capture "id" Text
  :> "boards"
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> QueryParam "lists" Text
  :> QueryParam "memberships" Text
  :> QueryParam "organization" Bool
  :> QueryParam "organization_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidboardsinvitedRoute
  =  "members"
  :> Capture "id" Text
  :> "boardsInvited"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidboardstarsRoute
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Verb 'GET 200 '[JSON] ()

type Membersidboardstars1Route
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> QueryParam "idBoard" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type MembersidboardstarsidstarRoute
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Capture "idStar" Text
  :> Verb 'GET 200 '[JSON] ()

type Membersidboardstarsidstar1Route
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Capture "idStar" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type Membersidboardstarsidstar2Route
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Capture "idStar" Text
  :> Verb 'DELETE 200 '[JSON] ()

type MembersidcardsRoute
  =  "members"
  :> Capture "id" Text
  :> "cards"
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidcustomboardbackgroundsRoute
  =  "members"
  :> Capture "id" Text
  :> "customBoardBackgrounds"
  :> Verb 'GET 200 '[JSON] ()

type Membersidcustomboardbackgrounds1Route
  =  "members"
  :> Capture "id" Text
  :> "customBoardBackgrounds"
  :> QueryParam "file" ByteString
  :> Verb 'POST 200 '[JSON] ()

type MembersidcustomboardbackgroundsidbackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> "customBoardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Membersidcustomboardbackgroundsidbackground1Route
  =  "members"
  :> Capture "id" Text
  :> "customBoardBackgrounds"
  :> Capture "idBackground" Text
  :> Verb 'DELETE 200 '[JSON] ()

type MembersidcustomemojiRoute
  =  "members"
  :> Capture "id" Text
  :> "customEmoji"
  :> Verb 'GET 200 '[JSON] ()

type Membersidcustomemoji1Route
  =  "members"
  :> Capture "id" Text
  :> "customEmoji"
  :> QueryParam "file" ByteString
  :> QueryParam "name" Text
  :> Verb 'POST 200 '[JSON] ()

type MembersidcustomemojiidemojiRoute
  =  "members"
  :> Capture "id" Text
  :> "customEmoji"
  :> Capture "idEmoji" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidcustomstickersRoute
  =  "members"
  :> Capture "id" Text
  :> "customStickers"
  :> Verb 'GET 200 '[JSON] ()

type Membersidcustomstickers1Route
  =  "members"
  :> Capture "id" Text
  :> "customStickers"
  :> QueryParam "file" ByteString
  :> Verb 'POST 200 '[JSON] ()

type Membersidcustomstickersidsticker1Route
  =  "members"
  :> Capture "id" Text
  :> "customStickers"
  :> Capture "idSticker" Text
  :> Verb 'DELETE 200 '[JSON] ()

type MembersidenterprisesRoute
  =  "members"
  :> Capture "id" Text
  :> "customStickers"
  :> Capture "idSticker" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidfieldRoute
  =  "members"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidnotificationsRoute
  =  "members"
  :> Capture "id" Text
  :> "notifications"
  :> QueryParam "entities" Bool
  :> QueryParam "display" Bool
  :> QueryParam "filter" Text
  :> QueryParam "read_filter" Text
  :> QueryParam "fields" Text
  :> QueryParam "limit" Int
  :> QueryParam "page" Int
  :> QueryParam "before" Text
  :> QueryParam "since" Text
  :> QueryParam "memberCreator" Bool
  :> QueryParam "memberCreator_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidonetimemessagesdismissedRoute
  =  "members"
  :> Capture "id" Text
  :> "oneTimeMessagesDismissed"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type MembersidorganizationsRoute
  =  "members"
  :> Capture "id" Text
  :> "organizations"
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> QueryParam "paid_account" Bool
  :> Verb 'GET 200 '[JSON] ()

type MembersidorganizationsinvitedRoute
  =  "members"
  :> Capture "id" Text
  :> "organizationsInvited"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type MembersidsavedsearchesRoute
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Verb 'GET 200 '[JSON] ()

type Membersidsavedsearches1Route
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> QueryParam "name" Text
  :> QueryParam "query" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type MembersidsavedsearchesidsearchRoute
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Capture "idSearch" Text
  :> Verb 'GET 200 '[JSON] ()

type Membersidsavedsearchesidsearch1Route
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Capture "idSearch" Text
  :> QueryParam "name" Text
  :> QueryParam "query" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type Membersidsavedsearchesidsearch2Route
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Capture "idSearch" Text
  :> Verb 'DELETE 200 '[JSON] ()

type MembersidtokensRoute
  =  "members"
  :> Capture "id" Text
  :> "tokens"
  :> QueryParam "webhooks" Bool
  :> Verb 'GET 200 '[JSON] ()

type NotificationsallreadRoute
  =  "notifications"
  :> "all"
  :> "read"
  :> Verb 'POST 200 '[JSON] ()

type NotificationsidRoute
  =  "notifications"
  :> Capture "id" Text
  :> QueryParam "board" Bool
  :> QueryParam "board_fields" Text
  :> QueryParam "card" Bool
  :> QueryParam "card_fields" Text
  :> QueryParam "display" Bool
  :> QueryParam "entities" Bool
  :> QueryParam "fields" Text
  :> QueryParam "list" Bool
  :> QueryParam "member" Bool
  :> QueryParam "member_fields" Text
  :> QueryParam "memberCreator" Bool
  :> QueryParam "memberCreator_fields" Text
  :> QueryParam "organization" Bool
  :> QueryParam "organization_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type Notificationsid1Route
  =  "notifications"
  :> Capture "id" Text
  :> QueryParam "unread" Bool
  :> Verb 'PUT 200 '[JSON] ()

type NotificationsidboardRoute
  =  "notifications"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type NotificationsidcardRoute
  =  "notifications"
  :> Capture "id" Text
  :> "card"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type NotificationsidfieldRoute
  =  "notifications"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type NotificationsidlistRoute
  =  "notifications"
  :> Capture "id" Text
  :> "list"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type NotificationsidmemberRoute
  =  "notifications"
  :> Capture "id" Text
  :> "member"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type NotificationsidmembercreatorRoute
  =  "notifications"
  :> Capture "id" Text
  :> "memberCreator"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type NotificationsidorganizationRoute
  =  "notifications"
  :> Capture "id" Text
  :> "organization"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type NotificationsidunreadRoute
  =  "notifications"
  :> Capture "id" Text
  :> "unread"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type Organizations1Route
  =  "organizations"
  :> QueryParam "displayName" Text
  :> QueryParam "desc" Text
  :> QueryParam "name" Text
  :> QueryParam "website" Text
  :> Verb 'POST 200 '[JSON] ()

type OrganizationsidRoute
  =  "organizations"
  :> Capture "id" Text
  :> Verb 'GET 200 '[JSON] ()

type Organizationsid1Route
  =  "organizations"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "displayName" Text
  :> QueryParam "desc" Text
  :> QueryParam "website" Text
  :> QueryParam "prefs/associatedDomain" Text
  :> QueryParam "prefs/externalMembersDisabled" Bool
  :> QueryParam "prefs/googleAppsVersion" Int
  :> QueryParam "prefs/boardVisibilityRestrict/org" Text
  :> QueryParam "prefs/boardVisibilityRestrict/private" Text
  :> QueryParam "prefs/boardVisibilityRestrict/public" Text
  :> QueryParam "prefs/orgInviteRestrict" Text
  :> QueryParam "prefs/permissionLevel" Text
  :> Verb 'PUT 200 '[JSON] ()

type Organizationsid2Route
  =  "organizations"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type OrganizationsidactionsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidboardsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "boards"
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidfieldRoute
  =  "organizations"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidlogoRoute
  =  "organizations"
  :> Capture "id" Text
  :> "logo"
  :> QueryParam "file" ByteString
  :> Verb 'POST 200 '[JSON] ()

type Organizationsidlogo1Route
  =  "organizations"
  :> Capture "id" Text
  :> "logo"
  :> Verb 'DELETE 200 '[JSON] ()

type OrganizationsidmembersRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Verb 'GET 200 '[JSON] ()

type Organizationsidmembers1Route
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> QueryParam "email" Text
  :> QueryParam "fullName" Text
  :> QueryParam "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type OrganizationsidmembersfilterRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidmembershipsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "memberships"
  :> QueryParam "filter" Text
  :> QueryParam "member" Bool
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidmembershipsidmembershipRoute
  =  "organizations"
  :> Capture "id" Text
  :> "memberships"
  :> Capture "idMembership" Text
  :> QueryParam "member" Bool
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidmembersidmemberRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> QueryParam "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type Organizationsidmembersidmember1Route
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type OrganizationsidmembersidmemberallRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> "all"
  :> Verb 'DELETE 200 '[JSON] ()

type OrganizationsidmembersidmemberdeactivatedRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> "deactivated"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type OrganizationsidmembersinvitedRoute
  =  "organizations"
  :> Capture "id" Text
  :> "membersInvited"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidnewbillableguestsidboardRoute
  =  "organizations"
  :> Capture "id" Text
  :> "newBillableGuests"
  :> Capture "idBoard" Text
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidplugindataRoute
  =  "organizations"
  :> Capture "id" Text
  :> "pluginData"
  :> Verb 'GET 200 '[JSON] ()

type OrganizationsidprefsassociateddomainRoute
  =  "organizations"
  :> Capture "id" Text
  :> "prefs"
  :> "associatedDomain"
  :> Verb 'DELETE 200 '[JSON] ()

type OrganizationsidprefsorginviterestrictRoute
  =  "organizations"
  :> Capture "id" Text
  :> "prefs"
  :> "orgInviteRestrict"
  :> Verb 'DELETE 200 '[JSON] ()

type OrganizationsidtagsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "tags"
  :> Verb 'GET 200 '[JSON] ()

type Organizationsidtags1Route
  =  "organizations"
  :> Capture "id" Text
  :> "tags"
  :> QueryParam "name" Text
  :> Verb 'POST 200 '[JSON] ()

type OrganizationsidtagsidtagRoute
  =  "organizations"
  :> Capture "id" Text
  :> "tags"
  :> Capture "idTag" Text
  :> Verb 'DELETE 200 '[JSON] ()

type Page1Route
  =  "labels"
  :> QueryParam "name" Text
  :> QueryParam "color" Text
  :> QueryParam "idBoard" Text
  :> Verb 'POST 200 '[JSON] ()

type PutMembersidcustomboardbackgroundsidbackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> ""
  :> "customBoardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "brightness" Text
  :> QueryParam "tile" Bool
  :> Verb 'PUT 200 '[JSON] ()

type Search1Route
  =  "search"
  :> QueryParam "query" Text
  :> QueryParam "idBoards" Text
  :> QueryParam "idOrganizations" Text
  :> QueryParam "idCards" Text
  :> QueryParam "modelTypes" Text
  :> QueryParam "board_fields" Text
  :> QueryParam "boards_limit" Int
  :> QueryParam "card_fields" Text
  :> QueryParam "cards_limit" Int
  :> QueryParam "cards_page" Int
  :> QueryParam "card_board" Bool
  :> QueryParam "card_list" Bool
  :> QueryParam "card_members" Bool
  :> QueryParam "card_stickers" Bool
  :> QueryParam "card_attachments" Text
  :> QueryParam "organization_fields" Text
  :> QueryParam "organizations_limit" Int
  :> QueryParam "member_fields" Text
  :> QueryParam "members_limit" Int
  :> QueryParam "partial" Bool
  :> Verb 'GET 200 '[JSON] ()

type SearchmembersRoute
  =  "search"
  :> "members"
  :> QueryParam "query" Text
  :> QueryParam "limit" Int
  :> QueryParam "idBoard" Text
  :> QueryParam "idOrganization" Text
  :> QueryParam "onlyOrgMembers" Bool
  :> Verb 'GET 200 '[JSON] ()

type TokenstokenRoute
  =  "tokens"
  :> Capture "token" Text
  :> QueryParam "fields" Text
  :> QueryParam "webhooks" Bool
  :> Verb 'GET 200 '[JSON] ()

type Tokenstoken1Route
  =  "tokens"
  :> Capture "token" Text
  :> Verb 'DELETE 200 '[JSON] ()

type TokenstokenmemberRoute
  =  "tokens"
  :> Capture "token" Text
  :> "member"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type TokenstokenwebhooksRoute
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Verb 'GET 200 '[JSON] ()

type Tokenstokenwebhooks1Route
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Capture "webhookId" Text
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> Verb 'PUT 200 '[JSON] ()

type Tokenstokenwebhooks2Route
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> Verb 'POST 200 '[JSON] ()

type TokenstokenwebhooksidwebhookRoute
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Capture "idWebhook" Text
  :> Verb 'GET 200 '[JSON] ()

type Tokenstokenwebhooksidwebhook1Route
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Capture "idWebhook" Text
  :> Verb 'DELETE 200 '[JSON] ()

type WebhookObject1Route
  =  "webhooks"
  :> Capture "id" Text
  :> Verb 'GET 200 '[JSON] ()

type Webhooks2Route
  =  "webhooks"
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> QueryParam "active" Bool
  :> Verb 'POST 200 '[JSON] ()

type WebhooksidRoute
  =  "webhooks"
  :> Capture "id" Text
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> QueryParam "active" Bool
  :> Verb 'PUT 200 '[JSON] ()

type Webhooksid1Route
  =  "webhooks"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type WebhooksidfieldRoute
  =  "webhooks"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()


type TrelloRESTAPI
    =    ActionsactionidRoute
    :<|> ActionsidRoute
    :<|> Actionsid1Route
    :<|> ActionsidactionreactionsRoute
    :<|> Actionsidactionreactions1Route
    :<|> ActionsidactionreactionsidRoute
    :<|> Actionsidactionreactionsid1Route
    :<|> ActionsidactionreactionssummaryRoute
    :<|> ActionsidboardRoute
    :<|> ActionsidcardRoute
    :<|> ActionsiddisplayRoute
    :<|> ActionsidfieldRoute
    :<|> ActionsidlistRoute
    :<|> ActionsidmemberRoute
    :<|> ActionsidmembercreatorRoute
    :<|> ActionsidorganizationRoute
    :<|> ActionsidtextRoute
    :<|> Batch1Route
    :<|> BoardsNestedResourcesRoute
    :<|> Boardsboardid1Route
    :<|> BoardsboardidactionsRoute
    :<|> Boardsboardidactions1Route
    :<|> Boardsboardidactions2Route
    :<|> Boardsboardidactions3Route
    :<|> BoardsboardidcardsfilterRoute
    :<|> BoardsboardididtagsRoute
    :<|> BoardsboardidlabelsRoute
    :<|> BoardsboardidlistsRoute
    :<|> BoardsboardidlistsfilterRoute
    :<|> BoardsboardidmembersRoute
    :<|> BoardsboardidtestRoute
    :<|> BoardsidRoute
    :<|> Boardsid1Route
    :<|> BoardsidboardpluginsRoute
    :<|> Boardsidboardplugins1Route
    :<|> Boardsidboardplugins2Route
    :<|> BoardsidcalendarkeygenerateRoute
    :<|> BoardsidcustomfieldsRoute
    :<|> BoardsidemailkeygenerateRoute
    :<|> BoardsididtagsRoute
    :<|> BoardsidlabelnamesmembersRoute
    :<|> BoardsidlabelnamesmembershipsidmembershipRoute
    :<|> BoardsidlabelnamesmembersidmemberRoute
    :<|> BoardsidlabelsRoute
    :<|> BoardsidlistsRoute
    :<|> BoardsidmarkedasviewedRoute
    :<|> BoardsidmembershipsRoute
    :<|> BoardsidmembersidmemberRoute
    :<|> BoardsidmyprefsemailpositionRoute
    :<|> BoardsidmyprefsidemaillistRoute
    :<|> BoardsidmyprefsshowlistguideRoute
    :<|> BoardsidmyprefsshowsidebaeRoute
    :<|> BoardsidmyprefsshowsidebaractivityRoute
    :<|> BoardsidmyprefsshowsidebarboardactionsRoute
    :<|> BoardsidmyprefsshowsidebarmembersRoute
    :<|> BoardsidpluginsRoute
    :<|> BoardsidpowerupsRoute
    :<|> BoardsidpowerupspowerupRoute
    :<|> Cards2Route
    :<|> CardsidRoute
    :<|> Cardsid1Route
    :<|> CardsidactionsRoute
    :<|> CardsidactionscommentsRoute
    :<|> CardsidactionsidactioncommentsRoute
    :<|> Cardsidactionsidactioncomments1Route
    :<|> CardsidattachmentsRoute
    :<|> Cardsidattachments1Route
    :<|> CardsidattachmentsidattachmentRoute
    :<|> Cardsidattachmentsidattachment1Route
    :<|> CardsidboardRoute
    :<|> CardsidcardchecklistidchecklistcheckitemidcheckitemRoute
    :<|> CardsidcheckitemidcheckitemRoute
    :<|> Cardsidcheckitemidcheckitem1Route
    :<|> Cardsidcheckitemidcheckitem2Route
    :<|> CardsidcheckitemstatesRoute
    :<|> CardsidchecklistsRoute
    :<|> Cardsidchecklists1Route
    :<|> CardsidchecklistsidchecklistRoute
    :<|> CardsidcustomfielditemsRoute
    :<|> CardsidfieldRoute
    :<|> CardsididlabelsRoute
    :<|> CardsididlabelsidlabelRoute
    :<|> CardsididmembersRoute
    :<|> CardsididmembersidmemberRoute
    :<|> CardsidlabelsRoute
    :<|> CardsidlistRoute
    :<|> CardsidmarkassociatednotificationsreadRoute
    :<|> CardsidmembersRoute
    :<|> CardsidmembersvotedRoute
    :<|> Cardsidmembersvoted1Route
    :<|> CardsidmembersvotedidmemberRoute
    :<|> CardsidplugindataRoute
    :<|> CardsidstickersRoute
    :<|> CardsidstickersidstickerRoute
    :<|> Cardsidstickersidsticker1Route
    :<|> Cardsidstickersidsticker2Route
    :<|> ChecklistsRoute
    :<|> ChecklistsidRoute
    :<|> Checklistsid1Route
    :<|> Checklistsid2Route
    :<|> ChecklistsidboardRoute
    :<|> ChecklistsidcardsRoute
    :<|> ChecklistsidcardscheckitemsRoute
    :<|> ChecklistsidcardscheckitemscheckitemidRoute
    :<|> ChecklistsidcheckitemsRoute
    :<|> ChecklistsidcheckitemsidRoute
    :<|> ChecklistsidcheckitemsidcheckitemRoute
    :<|> ChecklistsidfieldRoute
    :<|> ChecklistsidnameRoute
    :<|> CustomfielditemsidRoute
    :<|> CustomfieldsRoute
    :<|> CustomfieldsidRoute
    :<|> Customfieldsid1Route
    :<|> Customfieldsid3Route
    :<|> Customfieldsidoptions1Route
    :<|> Customfieldsidoptions2Route
    :<|> Customfieldsidoptionsidcustomfieldoption1Route
    :<|> Customfieldsidoptionsidcustomfieldoption3Route
    :<|> DeleteCardRoute
    :<|> EmojiRoute
    :<|> EnterprisesidRoute
    :<|> EnterprisesidadminsRoute
    :<|> EnterprisesidadminsidmemberRoute
    :<|> Enterprisesidadminsidmember1Route
    :<|> Enterprisesidadminsidmember2Route
    :<|> EnterprisesidmembersRoute
    :<|> EnterprisesidmembersidmemberRoute
    :<|> Enterprisesidmembersidmemberdeactivated1Route
    :<|> EnterprisesidsignupurlRoute
    :<|> EnterprisesidtokensRoute
    :<|> EnterprisesidtransferrableorganizationidorganizationRoute
    :<|> IdRoute
    :<|> Id1Route
    :<|> Id2Route
    :<|> IdcolorRoute
    :<|> IdnameRoute
    :<|> IdnextRoute
    :<|> Lists1Route
    :<|> ListsidRoute
    :<|> Listsid1Route
    :<|> ListsidactionsRoute
    :<|> ListsidarchiveallcardsRoute
    :<|> ListsidboardRoute
    :<|> ListsidcardsRoute
    :<|> ListsidclosedRoute
    :<|> ListsidfieldRoute
    :<|> ListsididboardRoute
    :<|> ListsidmoveallcardsRoute
    :<|> ListsidnameRoute
    :<|> ListsidposRoute
    :<|> ListsidsubscribedRoute
    :<|> MembersidRoute
    :<|> Membersid1Route
    :<|> MembersidactionsRoute
    :<|> MembersidavatarRoute
    :<|> MembersidboardbackgroundsRoute
    :<|> Membersidboardbackgrounds1Route
    :<|> MembersidboardbackgroundsidbackgroundRoute
    :<|> Membersidboardbackgroundsidbackground1Route
    :<|> Membersidboardbackgroundsidbackground2Route
    :<|> MembersidboardsRoute
    :<|> MembersidboardsinvitedRoute
    :<|> MembersidboardstarsRoute
    :<|> Membersidboardstars1Route
    :<|> MembersidboardstarsidstarRoute
    :<|> Membersidboardstarsidstar1Route
    :<|> Membersidboardstarsidstar2Route
    :<|> MembersidcardsRoute
    :<|> MembersidcustomboardbackgroundsRoute
    :<|> Membersidcustomboardbackgrounds1Route
    :<|> MembersidcustomboardbackgroundsidbackgroundRoute
    :<|> Membersidcustomboardbackgroundsidbackground1Route
    :<|> MembersidcustomemojiRoute
    :<|> Membersidcustomemoji1Route
    :<|> MembersidcustomemojiidemojiRoute
    :<|> MembersidcustomstickersRoute
    :<|> Membersidcustomstickers1Route
    :<|> Membersidcustomstickersidsticker1Route
    :<|> MembersidenterprisesRoute
    :<|> MembersidfieldRoute
    :<|> MembersidnotificationsRoute
    :<|> MembersidonetimemessagesdismissedRoute
    :<|> MembersidorganizationsRoute
    :<|> MembersidorganizationsinvitedRoute
    :<|> MembersidsavedsearchesRoute
    :<|> Membersidsavedsearches1Route
    :<|> MembersidsavedsearchesidsearchRoute
    :<|> Membersidsavedsearchesidsearch1Route
    :<|> Membersidsavedsearchesidsearch2Route
    :<|> MembersidtokensRoute
    :<|> NotificationsallreadRoute
    :<|> NotificationsidRoute
    :<|> Notificationsid1Route
    :<|> NotificationsidboardRoute
    :<|> NotificationsidcardRoute
    :<|> NotificationsidfieldRoute
    :<|> NotificationsidlistRoute
    :<|> NotificationsidmemberRoute
    :<|> NotificationsidmembercreatorRoute
    :<|> NotificationsidorganizationRoute
    :<|> NotificationsidunreadRoute
    :<|> Organizations1Route
    :<|> OrganizationsidRoute
    :<|> Organizationsid1Route
    :<|> Organizationsid2Route
    :<|> OrganizationsidactionsRoute
    :<|> OrganizationsidboardsRoute
    :<|> OrganizationsidfieldRoute
    :<|> OrganizationsidlogoRoute
    :<|> Organizationsidlogo1Route
    :<|> OrganizationsidmembersRoute
    :<|> Organizationsidmembers1Route
    :<|> OrganizationsidmembersfilterRoute
    :<|> OrganizationsidmembershipsRoute
    :<|> OrganizationsidmembershipsidmembershipRoute
    :<|> OrganizationsidmembersidmemberRoute
    :<|> Organizationsidmembersidmember1Route
    :<|> OrganizationsidmembersidmemberallRoute
    :<|> OrganizationsidmembersidmemberdeactivatedRoute
    :<|> OrganizationsidmembersinvitedRoute
    :<|> OrganizationsidnewbillableguestsidboardRoute
    :<|> OrganizationsidplugindataRoute
    :<|> OrganizationsidprefsassociateddomainRoute
    :<|> OrganizationsidprefsorginviterestrictRoute
    :<|> OrganizationsidtagsRoute
    :<|> Organizationsidtags1Route
    :<|> OrganizationsidtagsidtagRoute
    :<|> Page1Route
    :<|> PutMembersidcustomboardbackgroundsidbackgroundRoute
    :<|> Search1Route
    :<|> SearchmembersRoute
    :<|> TokenstokenRoute
    :<|> Tokenstoken1Route
    :<|> TokenstokenmemberRoute
    :<|> TokenstokenwebhooksRoute
    :<|> Tokenstokenwebhooks1Route
    :<|> Tokenstokenwebhooks2Route
    :<|> TokenstokenwebhooksidwebhookRoute
    :<|> Tokenstokenwebhooksidwebhook1Route
    :<|> WebhookObject1Route
    :<|> Webhooks2Route
    :<|> WebhooksidRoute
    :<|> Webhooksid1Route
    :<|> WebhooksidfieldRoute


