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

import Data.Time.Calendar (Day)
import Data.Text (Text)




-- | Servant type-level API, generated from the Swagger spec for TrelloREST.
type DeleteActionsRoute
  =  "actions"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteActionsReactionsByActionRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteBoardsRoute
  =  "boards"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteBoardsBoardpluginsByPluginRoute
  =  "boards"
  :> Capture "id" Text
  :> "boardPlugins"
  :> Capture "idPlugin" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteBoardsMembersByMemberRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteBoardsPowerupsByPowerupRoute
  =  "boards"
  :> Capture "id" Text
  :> "powerUps"
  :> Capture "powerUp" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsRoute
  =  "cards"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsActionsCommentsByActionRoute
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> Capture "idAction" Text
  :> "comments"
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsAttachmentsByAttachmentRoute
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> Capture "idAttachment" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsCheckitemByCheckitemRoute
  =  "cards"
  :> Capture "id" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsChecklistsByChecklistRoute
  =  "cards"
  :> Capture "id" Text
  :> "checklists"
  :> Capture "idChecklist" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsIdlabelsByLabelRoute
  =  "cards"
  :> Capture "id" Text
  :> "idLabels"
  :> Capture "idLabel" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsIdmembersByMemberRoute
  =  "cards"
  :> Capture "id" Text
  :> "idMembers"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsMembersvotedByMemberRoute
  =  "cards"
  :> Capture "id" Text
  :> "membersVoted"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCardsStickersByStickerRoute
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> Capture "idSticker" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteChecklistsRoute
  =  "checklists"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteChecklistsCheckitemsByCheckitemRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> Capture "idCheckItem" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCustomfieldsRoute
  =  "customfields"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteCustomfieldsOptionsByCustomfieldoptionRoute
  =  "customfields"
  :> Capture "id" Text
  :> "options"
  :> Capture "idCustomFieldOption" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteEnterprisesOrganizationsByOrganizationRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "organizations"
  :> Capture "idOrganization" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteLabelsRoute
  =  "labels"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteMembersBoardbackgroundsByBackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> Capture "idBackground" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteMembersBoardstarsByStarRoute
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Capture "idStar" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteMembersCustomboardbackgroundsByBackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> "customBoardBackgrounds"
  :> Capture "idBackground" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteMembersCustomstickersByStickerRoute
  =  "members"
  :> Capture "id" Text
  :> "customStickers"
  :> Capture "idSticker" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteMembersSavedsearchesBySearchRoute
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Capture "idSearch" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteOrganizationsRoute
  =  "organizations"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteOrganizationsLogoRoute
  =  "organizations"
  :> Capture "id" Text
  :> "logo"
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteOrganizationsMembersAllByMemberRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> "all"
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteOrganizationsMembersByMemberRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteOrganizationsPrefsAssociateddomainRoute
  =  "organizations"
  :> Capture "id" Text
  :> "prefs"
  :> "associatedDomain"
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteOrganizationsPrefsOrginviterestrictRoute
  =  "organizations"
  :> Capture "id" Text
  :> "prefs"
  :> "orgInviteRestrict"
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteOrganizationsTagsByTagRoute
  =  "organizations"
  :> Capture "id" Text
  :> "tags"
  :> Capture "idTag" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteTokensRoute
  =  "tokens"
  :> Capture "token" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteTokensWebhooksByTokenWebhookRoute
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Capture "idWebhook" Text
  :> Verb 'DELETE 200 '[JSON] ()

type DeleteWebhooksRoute
  =  "webhooks"
  :> Capture "id" Text
  :> Verb 'DELETE 200 '[JSON] ()

type GetActionsRoute
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

type GetActionsBoardRoute
  =  "actions"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetActionsByFieldRoute
  =  "actions"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetActionsCardRoute
  =  "actions"
  :> Capture "id" Text
  :> "card"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetActionsDisplayRoute
  =  "actions"
  :> Capture "id" Text
  :> "display"
  :> Verb 'GET 200 '[JSON] ()

type GetActionsListRoute
  =  "actions"
  :> Capture "id" Text
  :> "list"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetActionsMemberRoute
  =  "actions"
  :> Capture "id" Text
  :> "member"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetActionsMembercreatorRoute
  =  "actions"
  :> Capture "id" Text
  :> "memberCreator"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetActionsOrganizationRoute
  =  "actions"
  :> Capture "id" Text
  :> "organization"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetActionsReactionsRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> QueryParam "member" Bool
  :> QueryParam "emoji" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetActionsReactionsByActionRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> Capture "id" Text
  :> QueryParam "member" Bool
  :> QueryParam "emoji" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetActionsReactionssummaryRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactionsSummary"
  :> Verb 'GET 200 '[JSON] ()

type GetBatchRoute
  =  "batch"
  :> QueryParam "urls" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsRoute
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

type GetBoardsActionsRoute
  =  "boards"
  :> Capture "boardId" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsBoardpluginsRoute
  =  "boards"
  :> Capture "id" Text
  :> "boardPlugins"
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsBoardstarsRoute
  =  "boards"
  :> Capture "boardId" Text
  :> "boardStars"
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsByFieldRoute
  =  "boards"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsCardsRoute
  =  "boards"
  :> Capture "id" Text
  :> "cards"
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsCardsByBoardidFilterRoute
  =  "boards"
  :> Capture "boardId" Text
  :> "cards"
  :> Capture "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsCardsByCardRoute
  =  "boards"
  :> Capture "id" Text
  :> "cards"
  :> Capture "idCard" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsChecklistsRoute
  =  "boards"
  :> Capture "id" Text
  :> "checklists"
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsCustomfieldsRoute
  =  "boards"
  :> Capture "id" Text
  :> "customFields"
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsLabelsRoute
  =  "boards"
  :> Capture "id" Text
  :> "labels"
  :> QueryParam "fields" Text
  :> QueryParam "limit" Int
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsListsRoute
  =  "boards"
  :> Capture "id" Text
  :> "lists"
  :> QueryParam "cards" Text
  :> QueryParam "card_fields" Text
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsListsByFilterRoute
  =  "boards"
  :> Capture "id" Text
  :> "lists"
  :> Capture "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsMembersRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsMembershipsRoute
  =  "boards"
  :> Capture "id" Text
  :> "memberships"
  :> QueryParam "filter" Text
  :> QueryParam "activity" Bool
  :> QueryParam "orgMemberType" Bool
  :> QueryParam "member" Bool
  :> QueryParam "member_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsPluginsRoute
  =  "boards"
  :> Capture "id" Text
  :> "plugins"
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetBoardsTagsRoute
  =  "boards"
  :> Capture "id" Text
  :> "tags"
  :> Verb 'GET 200 '[JSON] ()

type GetCardsRoute
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

type GetCardsActionsRoute
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type GetCardsAttachmentsRoute
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> QueryParam "fields" Text
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsAttachmentsByAttachmentRoute
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> Capture "idAttachment" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsBoardRoute
  =  "cards"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsByFieldRoute
  =  "cards"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsCheckitemByCheckitemRoute
  =  "cards"
  :> Capture "id" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsCheckitemstatesRoute
  =  "cards"
  :> Capture "id" Text
  :> "checkItemStates"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsChecklistsRoute
  =  "cards"
  :> Capture "id" Text
  :> "checklists"
  :> QueryParam "checkItems" Text
  :> QueryParam "checkItem_fields" Text
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsCustomfielditemsRoute
  =  "cards"
  :> Capture "id" Text
  :> "customFieldItems"
  :> Verb 'GET 200 '[JSON] ()

type GetCardsListRoute
  =  "cards"
  :> Capture "id" Text
  :> "list"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsMembersRoute
  =  "cards"
  :> Capture "id" Text
  :> "members"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsMembersvotedRoute
  =  "cards"
  :> Capture "id" Text
  :> "membersVoted"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsPlugindataRoute
  =  "cards"
  :> Capture "id" Text
  :> "pluginData"
  :> Verb 'GET 200 '[JSON] ()

type GetCardsStickersRoute
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCardsStickersByStickerRoute
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> Capture "idSticker" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetChecklistsRoute
  =  "checklists"
  :> Capture "id" Text
  :> QueryParam "cards" Text
  :> QueryParam "checkItems" Text
  :> QueryParam "checkItem_fields" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetChecklistsBoardRoute
  =  "checklists"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetChecklistsByFieldRoute
  =  "checklists"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetChecklistsCardsRoute
  =  "checklists"
  :> Capture "id" Text
  :> "cards"
  :> Verb 'GET 200 '[JSON] ()

type GetChecklistsCheckitemsRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetChecklistsCheckitemsByCheckitemRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> Capture "idCheckItem" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCustomfieldsRoute
  =  "customfields"
  :> Capture "id" Text
  :> Verb 'GET 200 '[JSON] ()

type GetCustomfieldsOptionsRoute
  =  "customFields"
  :> Capture "id" Text
  :> "options"
  :> Verb 'GET 200 '[JSON] ()

type GetCustomfieldsOptionsByCustomfieldoptionRoute
  =  "customFields"
  :> Capture "id" Text
  :> "options"
  :> Capture "idCustomFieldOption" Text
  :> Verb 'GET 200 '[JSON] ()

type GetEmojiRoute
  =  "emoji"
  :> QueryParam "locale" Text
  :> QueryParam "spritesheets" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetEnterprisesRoute
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

type GetEnterprisesAdminsRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "admins"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetEnterprisesMembersRoute
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

type GetEnterprisesMembersByMemberRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> QueryParam "fields" Text
  :> QueryParam "organization_fields" Text
  :> QueryParam "board_fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetEnterprisesSignupurlRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "signupUrl"
  :> QueryParam "authenticate" Bool
  :> QueryParam "confirmationAccepted" Bool
  :> QueryParam "returnUrl" Text
  :> QueryParam "tosAccepted" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetEnterprisesTransferrableOrganizationByOrganizationRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "transferrable"
  :> "organization"
  :> Capture "idOrganization" Text
  :> Verb 'GET 200 '[JSON] ()

type GetLabelsRoute
  =  "labels"
  :> Capture "id" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetListsRoute
  =  "lists"
  :> Capture "id" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetListsActionsRoute
  =  "lists"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type GetListsBoardRoute
  =  "lists"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetListsByFieldRoute
  =  "lists"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetListsCardsRoute
  =  "lists"
  :> Capture "id" Text
  :> "cards"
  :> Verb 'GET 200 '[JSON] ()

type GetMembersRoute
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

type GetMembersActionsRoute
  =  "members"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type GetMembersBoardbackgroundsRoute
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersBoardbackgroundsByBackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersBoardsRoute
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

type GetMembersBoardsinvitedRoute
  =  "members"
  :> Capture "id" Text
  :> "boardsInvited"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersBoardstarsRoute
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Verb 'GET 200 '[JSON] ()

type GetMembersBoardstarsByStarRoute
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Capture "idStar" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersByFieldRoute
  =  "members"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersCardsRoute
  =  "members"
  :> Capture "id" Text
  :> "cards"
  :> QueryParam "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersCustomboardbackgroundsRoute
  =  "members"
  :> Capture "id" Text
  :> "customBoardBackgrounds"
  :> Verb 'GET 200 '[JSON] ()

type GetMembersCustomboardbackgroundsByBackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> "customBoardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersCustomemojiRoute
  =  "members"
  :> Capture "id" Text
  :> "customEmoji"
  :> Verb 'GET 200 '[JSON] ()

type GetMembersCustomemojiByEmojiRoute
  =  "members"
  :> Capture "id" Text
  :> "customEmoji"
  :> Capture "idEmoji" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersCustomstickersRoute
  =  "members"
  :> Capture "id" Text
  :> "customStickers"
  :> Verb 'GET 200 '[JSON] ()

type GetMembersCustomstickersByStickerRoute
  =  "members"
  :> Capture "id" Text
  :> "customStickers"
  :> Capture "idSticker" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersNotificationsRoute
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

type GetMembersOrganizationsRoute
  =  "members"
  :> Capture "id" Text
  :> "organizations"
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> QueryParam "paid_account" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetMembersOrganizationsinvitedRoute
  =  "members"
  :> Capture "id" Text
  :> "organizationsInvited"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersSavedsearchesRoute
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Verb 'GET 200 '[JSON] ()

type GetMembersSavedsearchesBySearchRoute
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Capture "idSearch" Text
  :> Verb 'GET 200 '[JSON] ()

type GetMembersTokensRoute
  =  "members"
  :> Capture "id" Text
  :> "tokens"
  :> QueryParam "webhooks" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetNotificationsRoute
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

type GetNotificationsBoardRoute
  =  "notifications"
  :> Capture "id" Text
  :> "board"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetNotificationsByFieldRoute
  =  "notifications"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetNotificationsCardRoute
  =  "notifications"
  :> Capture "id" Text
  :> "card"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetNotificationsListRoute
  =  "notifications"
  :> Capture "id" Text
  :> "list"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetNotificationsMemberRoute
  =  "notifications"
  :> Capture "id" Text
  :> "member"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetNotificationsMembercreatorRoute
  =  "notifications"
  :> Capture "id" Text
  :> "memberCreator"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetNotificationsOrganizationRoute
  =  "notifications"
  :> Capture "id" Text
  :> "organization"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsRoute
  =  "organizations"
  :> Capture "id" Text
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsActionsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "actions"
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsBoardsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "boards"
  :> QueryParam "filter" Text
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsByFieldRoute
  =  "organizations"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsExportsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "exports"
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsMembersRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsMembersByFilterRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "filter" Text
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsMembershipsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "memberships"
  :> QueryParam "filter" Text
  :> QueryParam "member" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsMembershipsByMembershipRoute
  =  "organizations"
  :> Capture "id" Text
  :> "memberships"
  :> Capture "idMembership" Text
  :> QueryParam "member" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsMembersinvitedRoute
  =  "organizations"
  :> Capture "id" Text
  :> "membersInvited"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsNewbillableguestsByBoardRoute
  =  "organizations"
  :> Capture "id" Text
  :> "newBillableGuests"
  :> Capture "idBoard" Text
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsPlugindataRoute
  =  "organizations"
  :> Capture "id" Text
  :> "pluginData"
  :> Verb 'GET 200 '[JSON] ()

type GetOrganizationsTagsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "tags"
  :> Verb 'GET 200 '[JSON] ()

type GetSearchRoute
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

type GetSearchMembersRoute
  =  "search"
  :> "members"
  :> QueryParam "query" Text
  :> QueryParam "limit" Int
  :> QueryParam "idBoard" Text
  :> QueryParam "idOrganization" Text
  :> QueryParam "onlyOrgMembers" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetTokensRoute
  =  "tokens"
  :> Capture "token" Text
  :> QueryParam "fields" Text
  :> QueryParam "webhooks" Bool
  :> Verb 'GET 200 '[JSON] ()

type GetTokensMemberRoute
  =  "tokens"
  :> Capture "token" Text
  :> "member"
  :> QueryParam "fields" Text
  :> Verb 'GET 200 '[JSON] ()

type GetTokensWebhooksRoute
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Verb 'GET 200 '[JSON] ()

type GetTokensWebhooksByTokenWebhookRoute
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Capture "idWebhook" Text
  :> Verb 'GET 200 '[JSON] ()

type GetWebhooksRoute
  =  "webhooks"
  :> Capture "id" Text
  :> Verb 'GET 200 '[JSON] ()

type GetWebhooksByFieldRoute
  =  "webhooks"
  :> Capture "id" Text
  :> Capture "field" Text
  :> Verb 'GET 200 '[JSON] ()

type PostActionsReactionsRoute
  =  "actions"
  :> Capture "idAction" Text
  :> "reactions"
  :> ReqBody '[JSON] Body_1
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsRoute
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

type PostBoardsBoardpluginsRoute
  =  "boards"
  :> Capture "id" Text
  :> "boardPlugins"
  :> QueryParam "idPlugin" Text
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsCalendarkeyGenerateRoute
  =  "boards"
  :> Capture "id" Text
  :> "calendarKey"
  :> "generate"
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsChecklistsRoute
  =  "boards"
  :> Capture "id" Text
  :> "checklists"
  :> QueryParam "name" Text
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsEmailkeyGenerateRoute
  =  "boards"
  :> Capture "id" Text
  :> "emailKey"
  :> "generate"
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsIdtagsRoute
  =  "boards"
  :> Capture "id" Text
  :> "idTags"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsLabelsRoute
  =  "boards"
  :> Capture "id" Text
  :> "labels"
  :> QueryParam "name" Text
  :> QueryParam "color" Text
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsListsRoute
  =  "boards"
  :> Capture "id" Text
  :> "lists"
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsMarkedasviewedRoute
  =  "boards"
  :> Capture "id" Text
  :> "markedAsViewed"
  :> Verb 'POST 200 '[JSON] ()

type PostBoardsPowerupsRoute
  =  "boards"
  :> Capture "id" Text
  :> "powerUps"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsRoute
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
  :> QueryParam "idCardSource" Text
  :> QueryParam "keepFromSource" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsActionsCommentsRoute
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> "comments"
  :> QueryParam "text" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsAttachmentsRoute
  =  "cards"
  :> Capture "id" Text
  :> "attachments"
  :> QueryParam "name" Text
  :> QueryParam "mimeType" Text
  :> QueryParam "url" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsChecklistsRoute
  =  "cards"
  :> Capture "id" Text
  :> "checklists"
  :> QueryParam "name" Text
  :> QueryParam "idChecklistSource" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsIdlabelsRoute
  =  "cards"
  :> Capture "id" Text
  :> "idLabels"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsIdmembersRoute
  =  "cards"
  :> Capture "id" Text
  :> "idMembers"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsLabelsRoute
  =  "cards"
  :> Capture "id" Text
  :> "labels"
  :> QueryParam "color" Text
  :> QueryParam "name" Text
  :> Verb 'POST 200 '[JSON] ()

type PostCardsMarkassociatednotificationsreadRoute
  =  "cards"
  :> Capture "id" Text
  :> "markAssociatedNotificationsRead"
  :> Verb 'POST 200 '[JSON] ()

type PostCardsMembersvotedRoute
  =  "cards"
  :> Capture "id" Text
  :> "membersVoted"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type PostChecklistsRoute
  =  "checklists"
  :> QueryParam "idCard" Text
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> QueryParam "idChecklistSource" Text
  :> Verb 'POST 200 '[JSON] ()

type PostChecklistsCheckitemsRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> QueryParam "checked" Bool
  :> Verb 'POST 200 '[JSON] ()

type PostCustomfieldsRoute
  =  "customFields"
  :> ReqBody '[JSON] Body
  :> Verb 'POST 200 '[JSON] ()

type PostCustomfieldsOptionsRoute
  =  "customFields"
  :> Capture "id" Text
  :> "options"
  :> Verb 'POST 200 '[JSON] ()

type PostEnterprisesTokensRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "tokens"
  :> QueryParam "expiration" Text
  :> Verb 'POST 200 '[JSON] ()

type PostLabelsRoute
  =  "labels"
  :> QueryParam "name" Text
  :> QueryParam "color" Text
  :> QueryParam "idBoard" Text
  :> Verb 'POST 200 '[JSON] ()

type PostListsRoute
  =  "lists"
  :> QueryParam "name" Text
  :> QueryParam "idBoard" Text
  :> QueryParam "idListSource" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type PostListsArchiveallcardsRoute
  =  "lists"
  :> Capture "id" Text
  :> "archiveAllCards"
  :> Verb 'POST 200 '[JSON] ()

type PostListsMoveallcardsRoute
  =  "lists"
  :> Capture "id" Text
  :> "moveAllCards"
  :> QueryParam "idBoard" Text
  :> QueryParam "idList" Text
  :> Verb 'POST 200 '[JSON] ()

type PostMembersBoardstarsRoute
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> QueryParam "idBoard" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type PostMembersOnetimemessagesdismissedRoute
  =  "members"
  :> Capture "id" Text
  :> "oneTimeMessagesDismissed"
  :> QueryParam "value" Text
  :> Verb 'POST 200 '[JSON] ()

type PostMembersSavedsearchesRoute
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> QueryParam "name" Text
  :> QueryParam "query" Text
  :> QueryParam "pos" Text
  :> Verb 'POST 200 '[JSON] ()

type PostNotificationsAllReadRoute
  =  "notifications"
  :> "all"
  :> "read"
  :> Verb 'POST 200 '[JSON] ()

type PostOrganizationsRoute
  =  "organizations"
  :> QueryParam "displayName" Text
  :> QueryParam "desc" Text
  :> QueryParam "name" Text
  :> QueryParam "website" Text
  :> Verb 'POST 200 '[JSON] ()

type PostOrganizationsExportsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "exports"
  :> QueryParam "attachments" Bool
  :> Verb 'POST 200 '[JSON] ()

type PostOrganizationsLogoRoute
  =  "organizations"
  :> Capture "id" Text
  :> "logo"
  :> Verb 'POST 200 '[JSON] ()

type PostOrganizationsTagsRoute
  =  "organizations"
  :> Capture "id" Text
  :> "tags"
  :> QueryParam "name" Text
  :> Verb 'POST 200 '[JSON] ()

type PostTokensWebhooksRoute
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> Verb 'POST 200 '[JSON] ()

type PostWebhooksRoute
  =  "webhooks"
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> QueryParam "active" Bool
  :> Verb 'POST 200 '[JSON] ()

type PutActionsRoute
  =  "actions"
  :> Capture "id" Text
  :> QueryParam "text" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutActionsTextRoute
  =  "actions"
  :> Capture "id" Text
  :> "text"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsRoute
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

type PutBoardsMembersRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> QueryParam "email" Text
  :> ReqBody '[JSON] Body_2
  :> Header "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMembersByMemberRoute
  =  "boards"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> QueryParam "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMembershipsByMembershipRoute
  =  "boards"
  :> Capture "id" Text
  :> "memberships"
  :> Capture "idMembership" Text
  :> QueryParam "type" Text
  :> QueryParam "member_fields" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMyprefsEmailpositionRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "emailPosition"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMyprefsIdemaillistRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "idEmailList"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMyprefsShowlistguideRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showListGuide"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMyprefsShowsidebarRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebar"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMyprefsShowsidebaractivityRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebarActivity"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMyprefsShowsidebarboardactionsRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebarBoardActions"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutBoardsMyprefsShowsidebarmembersRoute
  =  "boards"
  :> Capture "id" Text
  :> "myPrefs"
  :> "showSidebarMembers"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutCardCustomfieldItemByCardCustomfieldRoute
  =  "card"
  :> Capture "idCard" Text
  :> "customField"
  :> Capture "idCustomField" Text
  :> "item"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutCardsRoute
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

type PutCardsActionsCommentsByActionRoute
  =  "cards"
  :> Capture "id" Text
  :> "actions"
  :> Capture "idAction" Text
  :> "comments"
  :> QueryParam "text" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutCardsCheckitemByCheckitemRoute
  =  "cards"
  :> Capture "id" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> QueryParam "name" Text
  :> QueryParam "state" Text
  :> QueryParam "idChecklist" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutCardsChecklistCheckitemByCardCheckitemChecklistRoute
  =  "cards"
  :> Capture "idCard" Text
  :> "checklist"
  :> Capture "idChecklist" Text
  :> "checkItem"
  :> Capture "idCheckItem" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutCardsStickersByStickerRoute
  =  "cards"
  :> Capture "id" Text
  :> "stickers"
  :> Capture "idSticker" Text
  :> QueryParam "top" Float
  :> QueryParam "left" Float
  :> QueryParam "zIndex" Int
  :> QueryParam "rotate" Float
  :> Verb 'PUT 200 '[JSON] ()

type PutChecklistsRoute
  =  "checklists"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutChecklistsCheckitemsByCheckitemRoute
  =  "checklists"
  :> Capture "id" Text
  :> "checkItems"
  :> Capture "idCheckItem" Text
  :> QueryParam "pos" Int
  :> Verb 'PUT 200 '[JSON] ()

type PutChecklistsNameRoute
  =  "checklists"
  :> Capture "id" Text
  :> "name"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutCustomfieldsRoute
  =  "customfields"
  :> Capture "id" Text
  :> ReqBody '[JSON] Body_3
  :> Verb 'PUT 200 '[JSON] ()

type PutEnterprisesAdminsByMemberRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "admins"
  :> Capture "idMember" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutEnterprisesMembersDeactivatedByMemberRoute
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

type PutEnterprisesOrganizationsRoute
  =  "enterprises"
  :> Capture "id" Text
  :> "organizations"
  :> QueryParam "idOrganization" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutLabelsRoute
  =  "labels"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "color" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutLabelsColorRoute
  =  "labels"
  :> Capture "id" Text
  :> "color"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutLabelsNameRoute
  =  "labels"
  :> Capture "id" Text
  :> "name"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutListsRoute
  =  "lists"
  :> Capture "id" Text
  :> QueryParam "name" Text
  :> QueryParam "closed" Bool
  :> QueryParam "idBoard" Text
  :> QueryParam "pos" Text
  :> QueryParam "subscribed" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutListsClosedRoute
  =  "lists"
  :> Capture "id" Text
  :> "closed"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutListsIdboardRoute
  =  "lists"
  :> Capture "id" Text
  :> "idBoard"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutListsNameRoute
  =  "lists"
  :> Capture "id" Text
  :> "name"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutListsPosRoute
  =  "lists"
  :> Capture "id" Text
  :> "pos"
  :> QueryParam "value" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutListsSubscribedRoute
  =  "lists"
  :> Capture "id" Text
  :> "subscribed"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutMembersRoute
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

type PutMembersBoardbackgroundsByBackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> "boardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "brightness" Text
  :> QueryParam "tile" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutMembersBoardstarsByStarRoute
  =  "members"
  :> Capture "id" Text
  :> "boardStars"
  :> Capture "idStar" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutMembersCustomboardbackgroundsByBackgroundRoute
  =  "members"
  :> Capture "id" Text
  :> ""
  :> "customBoardBackgrounds"
  :> Capture "idBackground" Text
  :> QueryParam "brightness" Text
  :> QueryParam "tile" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutMembersSavedsearchesBySearchRoute
  =  "members"
  :> Capture "id" Text
  :> "savedSearches"
  :> Capture "idSearch" Text
  :> QueryParam "name" Text
  :> QueryParam "query" Text
  :> QueryParam "pos" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutNotificationsRoute
  =  "notifications"
  :> Capture "id" Text
  :> QueryParam "unread" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutNotificationsUnreadRoute
  =  "notifications"
  :> Capture "id" Text
  :> "unread"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutOrganizationsRoute
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

type PutOrganizationsMembersRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> QueryParam "email" Text
  :> QueryParam "fullName" Text
  :> QueryParam "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutOrganizationsMembersByMemberRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> QueryParam "type" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutOrganizationsMembersDeactivatedByMemberRoute
  =  "organizations"
  :> Capture "id" Text
  :> "members"
  :> Capture "idMember" Text
  :> "deactivated"
  :> QueryParam "value" Bool
  :> Verb 'PUT 200 '[JSON] ()

type PutTokensWebhooksByTokenWebhookidRoute
  =  "tokens"
  :> Capture "token" Text
  :> "webhooks"
  :> Capture "webhookId" Text
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> Verb 'PUT 200 '[JSON] ()

type PutWebhooksRoute
  =  "webhooks"
  :> Capture "id" Text
  :> QueryParam "description" Text
  :> QueryParam "callbackURL" Text
  :> QueryParam "idModel" Text
  :> QueryParam "active" Bool
  :> Verb 'PUT 200 '[JSON] ()


type TrelloRESTAPI
    =    DeleteActionsRoute
    :<|> DeleteActionsReactionsByActionRoute
    :<|> DeleteBoardsRoute
    :<|> DeleteBoardsBoardpluginsByPluginRoute
    :<|> DeleteBoardsMembersByMemberRoute
    :<|> DeleteBoardsPowerupsByPowerupRoute
    :<|> DeleteCardsRoute
    :<|> DeleteCardsActionsCommentsByActionRoute
    :<|> DeleteCardsAttachmentsByAttachmentRoute
    :<|> DeleteCardsCheckitemByCheckitemRoute
    :<|> DeleteCardsChecklistsByChecklistRoute
    :<|> DeleteCardsIdlabelsByLabelRoute
    :<|> DeleteCardsIdmembersByMemberRoute
    :<|> DeleteCardsMembersvotedByMemberRoute
    :<|> DeleteCardsStickersByStickerRoute
    :<|> DeleteChecklistsRoute
    :<|> DeleteChecklistsCheckitemsByCheckitemRoute
    :<|> DeleteCustomfieldsRoute
    :<|> DeleteCustomfieldsOptionsByCustomfieldoptionRoute
    :<|> DeleteEnterprisesOrganizationsByOrganizationRoute
    :<|> DeleteLabelsRoute
    :<|> DeleteMembersBoardbackgroundsByBackgroundRoute
    :<|> DeleteMembersBoardstarsByStarRoute
    :<|> DeleteMembersCustomboardbackgroundsByBackgroundRoute
    :<|> DeleteMembersCustomstickersByStickerRoute
    :<|> DeleteMembersSavedsearchesBySearchRoute
    :<|> DeleteOrganizationsRoute
    :<|> DeleteOrganizationsLogoRoute
    :<|> DeleteOrganizationsMembersAllByMemberRoute
    :<|> DeleteOrganizationsMembersByMemberRoute
    :<|> DeleteOrganizationsPrefsAssociateddomainRoute
    :<|> DeleteOrganizationsPrefsOrginviterestrictRoute
    :<|> DeleteOrganizationsTagsByTagRoute
    :<|> DeleteTokensRoute
    :<|> DeleteTokensWebhooksByTokenWebhookRoute
    :<|> DeleteWebhooksRoute
    :<|> GetActionsRoute
    :<|> GetActionsBoardRoute
    :<|> GetActionsByFieldRoute
    :<|> GetActionsCardRoute
    :<|> GetActionsDisplayRoute
    :<|> GetActionsListRoute
    :<|> GetActionsMemberRoute
    :<|> GetActionsMembercreatorRoute
    :<|> GetActionsOrganizationRoute
    :<|> GetActionsReactionsRoute
    :<|> GetActionsReactionsByActionRoute
    :<|> GetActionsReactionssummaryRoute
    :<|> GetBatchRoute
    :<|> GetBoardsRoute
    :<|> GetBoardsActionsRoute
    :<|> GetBoardsBoardpluginsRoute
    :<|> GetBoardsBoardstarsRoute
    :<|> GetBoardsByFieldRoute
    :<|> GetBoardsCardsRoute
    :<|> GetBoardsCardsByBoardidFilterRoute
    :<|> GetBoardsCardsByCardRoute
    :<|> GetBoardsChecklistsRoute
    :<|> GetBoardsCustomfieldsRoute
    :<|> GetBoardsLabelsRoute
    :<|> GetBoardsListsRoute
    :<|> GetBoardsListsByFilterRoute
    :<|> GetBoardsMembersRoute
    :<|> GetBoardsMembershipsRoute
    :<|> GetBoardsPluginsRoute
    :<|> GetBoardsTagsRoute
    :<|> GetCardsRoute
    :<|> GetCardsActionsRoute
    :<|> GetCardsAttachmentsRoute
    :<|> GetCardsAttachmentsByAttachmentRoute
    :<|> GetCardsBoardRoute
    :<|> GetCardsByFieldRoute
    :<|> GetCardsCheckitemByCheckitemRoute
    :<|> GetCardsCheckitemstatesRoute
    :<|> GetCardsChecklistsRoute
    :<|> GetCardsCustomfielditemsRoute
    :<|> GetCardsListRoute
    :<|> GetCardsMembersRoute
    :<|> GetCardsMembersvotedRoute
    :<|> GetCardsPlugindataRoute
    :<|> GetCardsStickersRoute
    :<|> GetCardsStickersByStickerRoute
    :<|> GetChecklistsRoute
    :<|> GetChecklistsBoardRoute
    :<|> GetChecklistsByFieldRoute
    :<|> GetChecklistsCardsRoute
    :<|> GetChecklistsCheckitemsRoute
    :<|> GetChecklistsCheckitemsByCheckitemRoute
    :<|> GetCustomfieldsRoute
    :<|> GetCustomfieldsOptionsRoute
    :<|> GetCustomfieldsOptionsByCustomfieldoptionRoute
    :<|> GetEmojiRoute
    :<|> GetEnterprisesRoute
    :<|> GetEnterprisesAdminsRoute
    :<|> GetEnterprisesMembersRoute
    :<|> GetEnterprisesMembersByMemberRoute
    :<|> GetEnterprisesSignupurlRoute
    :<|> GetEnterprisesTransferrableOrganizationByOrganizationRoute
    :<|> GetLabelsRoute
    :<|> GetListsRoute
    :<|> GetListsActionsRoute
    :<|> GetListsBoardRoute
    :<|> GetListsByFieldRoute
    :<|> GetListsCardsRoute
    :<|> GetMembersRoute
    :<|> GetMembersActionsRoute
    :<|> GetMembersBoardbackgroundsRoute
    :<|> GetMembersBoardbackgroundsByBackgroundRoute
    :<|> GetMembersBoardsRoute
    :<|> GetMembersBoardsinvitedRoute
    :<|> GetMembersBoardstarsRoute
    :<|> GetMembersBoardstarsByStarRoute
    :<|> GetMembersByFieldRoute
    :<|> GetMembersCardsRoute
    :<|> GetMembersCustomboardbackgroundsRoute
    :<|> GetMembersCustomboardbackgroundsByBackgroundRoute
    :<|> GetMembersCustomemojiRoute
    :<|> GetMembersCustomemojiByEmojiRoute
    :<|> GetMembersCustomstickersRoute
    :<|> GetMembersCustomstickersByStickerRoute
    :<|> GetMembersNotificationsRoute
    :<|> GetMembersOrganizationsRoute
    :<|> GetMembersOrganizationsinvitedRoute
    :<|> GetMembersSavedsearchesRoute
    :<|> GetMembersSavedsearchesBySearchRoute
    :<|> GetMembersTokensRoute
    :<|> GetNotificationsRoute
    :<|> GetNotificationsBoardRoute
    :<|> GetNotificationsByFieldRoute
    :<|> GetNotificationsCardRoute
    :<|> GetNotificationsListRoute
    :<|> GetNotificationsMemberRoute
    :<|> GetNotificationsMembercreatorRoute
    :<|> GetNotificationsOrganizationRoute
    :<|> GetOrganizationsRoute
    :<|> GetOrganizationsActionsRoute
    :<|> GetOrganizationsBoardsRoute
    :<|> GetOrganizationsByFieldRoute
    :<|> GetOrganizationsExportsRoute
    :<|> GetOrganizationsMembersRoute
    :<|> GetOrganizationsMembersByFilterRoute
    :<|> GetOrganizationsMembershipsRoute
    :<|> GetOrganizationsMembershipsByMembershipRoute
    :<|> GetOrganizationsMembersinvitedRoute
    :<|> GetOrganizationsNewbillableguestsByBoardRoute
    :<|> GetOrganizationsPlugindataRoute
    :<|> GetOrganizationsTagsRoute
    :<|> GetSearchRoute
    :<|> GetSearchMembersRoute
    :<|> GetTokensRoute
    :<|> GetTokensMemberRoute
    :<|> GetTokensWebhooksRoute
    :<|> GetTokensWebhooksByTokenWebhookRoute
    :<|> GetWebhooksRoute
    :<|> GetWebhooksByFieldRoute
    :<|> PostActionsReactionsRoute
    :<|> PostBoardsRoute
    :<|> PostBoardsBoardpluginsRoute
    :<|> PostBoardsCalendarkeyGenerateRoute
    :<|> PostBoardsChecklistsRoute
    :<|> PostBoardsEmailkeyGenerateRoute
    :<|> PostBoardsIdtagsRoute
    :<|> PostBoardsLabelsRoute
    :<|> PostBoardsListsRoute
    :<|> PostBoardsMarkedasviewedRoute
    :<|> PostBoardsPowerupsRoute
    :<|> PostCardsRoute
    :<|> PostCardsActionsCommentsRoute
    :<|> PostCardsAttachmentsRoute
    :<|> PostCardsChecklistsRoute
    :<|> PostCardsIdlabelsRoute
    :<|> PostCardsIdmembersRoute
    :<|> PostCardsLabelsRoute
    :<|> PostCardsMarkassociatednotificationsreadRoute
    :<|> PostCardsMembersvotedRoute
    :<|> PostChecklistsRoute
    :<|> PostChecklistsCheckitemsRoute
    :<|> PostCustomfieldsRoute
    :<|> PostCustomfieldsOptionsRoute
    :<|> PostEnterprisesTokensRoute
    :<|> PostLabelsRoute
    :<|> PostListsRoute
    :<|> PostListsArchiveallcardsRoute
    :<|> PostListsMoveallcardsRoute
    :<|> PostMembersBoardstarsRoute
    :<|> PostMembersOnetimemessagesdismissedRoute
    :<|> PostMembersSavedsearchesRoute
    :<|> PostNotificationsAllReadRoute
    :<|> PostOrganizationsRoute
    :<|> PostOrganizationsExportsRoute
    :<|> PostOrganizationsLogoRoute
    :<|> PostOrganizationsTagsRoute
    :<|> PostTokensWebhooksRoute
    :<|> PostWebhooksRoute
    :<|> PutActionsRoute
    :<|> PutActionsTextRoute
    :<|> PutBoardsRoute
    :<|> PutBoardsMembersRoute
    :<|> PutBoardsMembersByMemberRoute
    :<|> PutBoardsMembershipsByMembershipRoute
    :<|> PutBoardsMyprefsEmailpositionRoute
    :<|> PutBoardsMyprefsIdemaillistRoute
    :<|> PutBoardsMyprefsShowlistguideRoute
    :<|> PutBoardsMyprefsShowsidebarRoute
    :<|> PutBoardsMyprefsShowsidebaractivityRoute
    :<|> PutBoardsMyprefsShowsidebarboardactionsRoute
    :<|> PutBoardsMyprefsShowsidebarmembersRoute
    :<|> PutCardCustomfieldItemByCardCustomfieldRoute
    :<|> PutCardsRoute
    :<|> PutCardsActionsCommentsByActionRoute
    :<|> PutCardsCheckitemByCheckitemRoute
    :<|> PutCardsChecklistCheckitemByCardCheckitemChecklistRoute
    :<|> PutCardsStickersByStickerRoute
    :<|> PutChecklistsRoute
    :<|> PutChecklistsCheckitemsByCheckitemRoute
    :<|> PutChecklistsNameRoute
    :<|> PutCustomfieldsRoute
    :<|> PutEnterprisesAdminsByMemberRoute
    :<|> PutEnterprisesMembersDeactivatedByMemberRoute
    :<|> PutEnterprisesOrganizationsRoute
    :<|> PutLabelsRoute
    :<|> PutLabelsColorRoute
    :<|> PutLabelsNameRoute
    :<|> PutListsRoute
    :<|> PutListsClosedRoute
    :<|> PutListsIdboardRoute
    :<|> PutListsNameRoute
    :<|> PutListsPosRoute
    :<|> PutListsSubscribedRoute
    :<|> PutMembersRoute
    :<|> PutMembersBoardbackgroundsByBackgroundRoute
    :<|> PutMembersBoardstarsByStarRoute
    :<|> PutMembersCustomboardbackgroundsByBackgroundRoute
    :<|> PutMembersSavedsearchesBySearchRoute
    :<|> PutNotificationsRoute
    :<|> PutNotificationsUnreadRoute
    :<|> PutOrganizationsRoute
    :<|> PutOrganizationsMembersRoute
    :<|> PutOrganizationsMembersByMemberRoute
    :<|> PutOrganizationsMembersDeactivatedByMemberRoute
    :<|> PutTokensWebhooksByTokenWebhookidRoute
    :<|> PutWebhooksRoute


