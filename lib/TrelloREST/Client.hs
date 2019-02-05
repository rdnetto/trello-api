{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-unused-imports -fno-warn-missing-signatures -freduction-depth=0 #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE ViewPatterns #-}

module TrelloREST.Client (
    TrelloRESTClientMonad(..),
    deleteActions,
    deleteActionsReactionsByAction,
    deleteBoards,
    deleteBoardsBoardpluginsByPlugin,
    deleteBoardsMembersByMember,
    deleteBoardsPowerupsByPowerup,
    deleteCards,
    deleteCardsActionsCommentsByAction,
    deleteCardsAttachmentsByAttachment,
    deleteCardsCheckitemByCheckitem,
    deleteCardsChecklistsByChecklist,
    deleteCardsIdlabelsByLabel,
    deleteCardsIdmembersByMember,
    deleteCardsMembersvotedByMember,
    deleteCardsStickersBySticker,
    deleteChecklists,
    deleteChecklistsCheckitemsByCheckitem,
    deleteCustomfields,
    deleteCustomfieldsOptionsByCustomfieldoption,
    deleteEnterprisesOrganizationsByOrganization,
    deleteLabels,
    deleteMembersBoardbackgroundsByBackground,
    deleteMembersBoardstarsByStar,
    deleteMembersCustomboardbackgroundsByBackground,
    deleteMembersCustomstickersBySticker,
    deleteMembersSavedsearchesBySearch,
    deleteOrganizations,
    deleteOrganizationsLogo,
    deleteOrganizationsMembersAllByMember,
    deleteOrganizationsMembersByMember,
    deleteOrganizationsPrefsAssociateddomain,
    deleteOrganizationsPrefsOrginviterestrict,
    deleteOrganizationsTagsByTag,
    deleteTokens,
    deleteTokensWebhooksByTokenWebhook,
    deleteWebhooks,
    getActions,
    getActionsBoard,
    getActionsByField,
    getActionsCard,
    getActionsDisplay,
    getActionsList,
    getActionsMember,
    getActionsMembercreator,
    getActionsOrganization,
    getActionsReactions,
    getActionsReactionsByAction,
    getActionsReactionssummary,
    getBatch,
    getBoards,
    getBoardsActions,
    getBoardsBoardplugins,
    getBoardsBoardstars,
    getBoardsByField,
    getBoardsCards,
    getBoardsCardsByBoardidFilter,
    getBoardsCardsByCard,
    getBoardsChecklists,
    getBoardsCustomfields,
    getBoardsLabels,
    getBoardsLists,
    getBoardsListsByFilter,
    getBoardsMembers,
    getBoardsMemberships,
    getBoardsPlugins,
    getBoardsTags,
    getCards,
    getCardsActions,
    getCardsAttachments,
    getCardsAttachmentsByAttachment,
    getCardsBoard,
    getCardsByField,
    getCardsCheckitemByCheckitem,
    getCardsCheckitemstates,
    getCardsChecklists,
    getCardsCustomfielditems,
    getCardsList,
    getCardsMembers,
    getCardsMembersvoted,
    getCardsPlugindata,
    getCardsStickers,
    getCardsStickersBySticker,
    getChecklists,
    getChecklistsBoard,
    getChecklistsByField,
    getChecklistsCards,
    getChecklistsCheckitems,
    getChecklistsCheckitemsByCheckitem,
    getCustomfields,
    getCustomfieldsOptions,
    getCustomfieldsOptionsByCustomfieldoption,
    getEmoji,
    getEnterprises,
    getEnterprisesAdmins,
    getEnterprisesMembers,
    getEnterprisesMembersByMember,
    getEnterprisesSignupurl,
    getEnterprisesTransferrableOrganizationByOrganization,
    getLabels,
    getLists,
    getListsActions,
    getListsBoard,
    getListsByField,
    getListsCards,
    getMembers,
    getMembersActions,
    getMembersBoardbackgrounds,
    getMembersBoardbackgroundsByBackground,
    getMembersBoards,
    getMembersBoardsinvited,
    getMembersBoardstars,
    getMembersBoardstarsByStar,
    getMembersByField,
    getMembersCards,
    getMembersCustomboardbackgrounds,
    getMembersCustomboardbackgroundsByBackground,
    getMembersCustomemoji,
    getMembersCustomemojiByEmoji,
    getMembersCustomstickers,
    getMembersCustomstickersBySticker,
    getMembersNotifications,
    getMembersOrganizations,
    getMembersOrganizationsinvited,
    getMembersSavedsearches,
    getMembersSavedsearchesBySearch,
    getMembersTokens,
    getNotifications,
    getNotificationsBoard,
    getNotificationsByField,
    getNotificationsCard,
    getNotificationsList,
    getNotificationsMember,
    getNotificationsMembercreator,
    getNotificationsOrganization,
    getOrganizations,
    getOrganizationsActions,
    getOrganizationsBoards,
    getOrganizationsByField,
    getOrganizationsExports,
    getOrganizationsMembers,
    getOrganizationsMembersByFilter,
    getOrganizationsMemberships,
    getOrganizationsMembershipsByMembership,
    getOrganizationsMembersinvited,
    getOrganizationsNewbillableguestsByBoard,
    getOrganizationsPlugindata,
    getOrganizationsTags,
    getSearch,
    getSearchMembers,
    getTokens,
    getTokensMember,
    getTokensWebhooks,
    getTokensWebhooksByTokenWebhook,
    getWebhooks,
    getWebhooksByField,
    postActionsReactions,
    postBoards,
    postBoardsBoardplugins,
    postBoardsCalendarkeyGenerate,
    postBoardsChecklists,
    postBoardsEmailkeyGenerate,
    postBoardsIdtags,
    postBoardsLabels,
    postBoardsLists,
    postBoardsMarkedasviewed,
    postBoardsPowerups,
    postCards,
    postCardsActionsComments,
    postCardsAttachments,
    postCardsChecklists,
    postCardsIdlabels,
    postCardsIdmembers,
    postCardsLabels,
    postCardsMarkassociatednotificationsread,
    postCardsMembersvoted,
    postChecklists,
    postChecklistsCheckitems,
    postCustomfields,
    postCustomfieldsOptions,
    postEnterprisesTokens,
    postLabels,
    postLists,
    postListsArchiveallcards,
    postListsMoveallcards,
    postMembersBoardstars,
    postMembersOnetimemessagesdismissed,
    postMembersSavedsearches,
    postNotificationsAllRead,
    postOrganizations,
    postOrganizationsExports,
    postOrganizationsLogo,
    postOrganizationsTags,
    postTokensWebhooks,
    postWebhooks,
    putActions,
    putActionsText,
    putBoards,
    putBoardsMembers,
    putBoardsMembersByMember,
    putBoardsMembershipsByMembership,
    putBoardsMyprefsEmailposition,
    putBoardsMyprefsIdemaillist,
    putBoardsMyprefsShowlistguide,
    putBoardsMyprefsShowsidebar,
    putBoardsMyprefsShowsidebaractivity,
    putBoardsMyprefsShowsidebarboardactions,
    putBoardsMyprefsShowsidebarmembers,
    putCardCustomfieldItemByCardCustomfield,
    putCards,
    putCardsActionsCommentsByAction,
    putCardsCheckitemByCheckitem,
    putCardsChecklistCheckitemByCardCheckitemChecklist,
    putCardsStickersBySticker,
    putChecklists,
    putChecklistsCheckitemsByCheckitem,
    putChecklistsName,
    putCustomfields,
    putEnterprisesAdminsByMember,
    putEnterprisesMembersDeactivatedByMember,
    putEnterprisesOrganizations,
    putLabels,
    putLabelsColor,
    putLabelsName,
    putLists,
    putListsClosed,
    putListsIdboard,
    putListsName,
    putListsPos,
    putListsSubscribed,
    putMembers,
    putMembersBoardbackgroundsByBackground,
    putMembersBoardstarsByStar,
    putMembersCustomboardbackgroundsByBackground,
    putMembersSavedsearchesBySearch,
    putNotifications,
    putNotificationsUnread,
    putOrganizations,
    putOrganizationsMembers,
    putOrganizationsMembersByMember,
    putOrganizationsMembersDeactivatedByMember,
    putTokensWebhooksByTokenWebhookid,
    putWebhooks,
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

import Data.Text (Text)
import Data.Time.Calendar (Day)


-- | Monads in which client calls may be embedded.
class Monad m => TrelloRESTClientMonad m where
  liftTrelloRESTClient :: ClientM a -> m a


-- We generate the clients directly from the routes as a workaround for https://github.com/haskell-servant/servant/issues/986
{- | DELETE /actions/{id}
     Delete a comment action
 -}
deleteActions :: TrelloRESTClientMonad m => Text -> m ()
deleteActions x0  = deleteActions' (coerce x0)  where
  deleteActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteActionsRoute

{- | DELETE /actions/{idAction}/reactions/{id}
     Deletes a reaction
 -}
deleteActionsReactionsByAction :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteActionsReactionsByAction x0 x1  = deleteActionsReactionsByAction' (coerce x0) (coerce x1)  where
  deleteActionsReactionsByAction' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteActionsReactionsByActionRoute

{- | DELETE /boards/{id}
     Delete a board.
 -}
deleteBoards :: TrelloRESTClientMonad m => Text -> m ()
deleteBoards x0  = deleteBoards' (coerce x0)  where
  deleteBoards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteBoardsRoute

{- | DELETE /boards/{id}/boardPlugins/{idPlugin}
     Disable a Power-Up on a board
 -}
deleteBoardsBoardpluginsByPlugin :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteBoardsBoardpluginsByPlugin x0 x1  = deleteBoardsBoardpluginsByPlugin' (coerce x0) (coerce x1)  where
  deleteBoardsBoardpluginsByPlugin' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteBoardsBoardpluginsByPluginRoute

{- | DELETE /boards/{id}/members/{idMember}
     
 -}
deleteBoardsMembersByMember :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteBoardsMembersByMember x0 x1  = deleteBoardsMembersByMember' (coerce x0) (coerce x1)  where
  deleteBoardsMembersByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteBoardsMembersByMemberRoute

{- | DELETE /boards/{id}/powerUps/{powerUp}
     
 -}
deleteBoardsPowerupsByPowerup :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteBoardsPowerupsByPowerup x0 x1  = deleteBoardsPowerupsByPowerup' (coerce x0) (coerce x1)  where
  deleteBoardsPowerupsByPowerup' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteBoardsPowerupsByPowerupRoute

{- | DELETE /cards/{id}
     Delete a card
 -}
deleteCards :: TrelloRESTClientMonad m => Text -> m ()
deleteCards x0  = deleteCards' (coerce x0)  where
  deleteCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsRoute

{- | DELETE /cards/{id}/actions/{idAction}/comments
     Delete a comment
 -}
deleteCardsActionsCommentsByAction :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsActionsCommentsByAction x0 x1  = deleteCardsActionsCommentsByAction' (coerce x0) (coerce x1)  where
  deleteCardsActionsCommentsByAction' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsActionsCommentsByActionRoute

{- | DELETE /cards/{id}/attachments/{idAttachment}
     Delete an attachment
 -}
deleteCardsAttachmentsByAttachment :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsAttachmentsByAttachment x0 x1  = deleteCardsAttachmentsByAttachment' (coerce x0) (coerce x1)  where
  deleteCardsAttachmentsByAttachment' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsAttachmentsByAttachmentRoute

{- | DELETE /cards/{id}/checkItem/{idCheckItem}
     Delete a checklist item
 -}
deleteCardsCheckitemByCheckitem :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsCheckitemByCheckitem x0 x1  = deleteCardsCheckitemByCheckitem' (coerce x0) (coerce x1)  where
  deleteCardsCheckitemByCheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsCheckitemByCheckitemRoute

{- | DELETE /cards/{id}/checklists/{idChecklist}
     Delete a checklist from a card
 -}
deleteCardsChecklistsByChecklist :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsChecklistsByChecklist x0 x1  = deleteCardsChecklistsByChecklist' (coerce x0) (coerce x1)  where
  deleteCardsChecklistsByChecklist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsChecklistsByChecklistRoute

{- | DELETE /cards/{id}/idLabels/{idLabel}
     Remove a label from a card
 -}
deleteCardsIdlabelsByLabel :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsIdlabelsByLabel x0 x1  = deleteCardsIdlabelsByLabel' (coerce x0) (coerce x1)  where
  deleteCardsIdlabelsByLabel' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsIdlabelsByLabelRoute

{- | DELETE /cards/{id}/idMembers/{idMember}
     Remove a member from a card
 -}
deleteCardsIdmembersByMember :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsIdmembersByMember x0 x1  = deleteCardsIdmembersByMember' (coerce x0) (coerce x1)  where
  deleteCardsIdmembersByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsIdmembersByMemberRoute

{- | DELETE /cards/{id}/membersVoted/{idMember}
     Remove a member's vote from a card
 -}
deleteCardsMembersvotedByMember :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsMembersvotedByMember x0 x1  = deleteCardsMembersvotedByMember' (coerce x0) (coerce x1)  where
  deleteCardsMembersvotedByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsMembersvotedByMemberRoute

{- | DELETE /cards/{id}/stickers/{idSticker}
     Remove a sticker from the card
 -}
deleteCardsStickersBySticker :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCardsStickersBySticker x0 x1  = deleteCardsStickersBySticker' (coerce x0) (coerce x1)  where
  deleteCardsStickersBySticker' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCardsStickersByStickerRoute

{- | DELETE /checklists/{id}
     Delete a checklist
 -}
deleteChecklists :: TrelloRESTClientMonad m => Text -> m ()
deleteChecklists x0  = deleteChecklists' (coerce x0)  where
  deleteChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteChecklistsRoute

{- | DELETE /checklists/{id}/checkItems/{idCheckItem}
     Remove an item from a checklist
 -}
deleteChecklistsCheckitemsByCheckitem :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteChecklistsCheckitemsByCheckitem x0 x1  = deleteChecklistsCheckitemsByCheckitem' (coerce x0) (coerce x1)  where
  deleteChecklistsCheckitemsByCheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteChecklistsCheckitemsByCheckitemRoute

{- | DELETE /customfields/{id}
     Delete a Custom Field from a board.
 -}
deleteCustomfields :: TrelloRESTClientMonad m => Text -> m ()
deleteCustomfields x0  = deleteCustomfields' (coerce x0)  where
  deleteCustomfields' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCustomfieldsRoute

{- | DELETE /customfields/{id}/options/{idCustomFieldOption}
     Delete an option from a Custom Field dropdown.
 -}
deleteCustomfieldsOptionsByCustomfieldoption :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteCustomfieldsOptionsByCustomfieldoption x0 x1  = deleteCustomfieldsOptionsByCustomfieldoption' (coerce x0) (coerce x1)  where
  deleteCustomfieldsOptionsByCustomfieldoption' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteCustomfieldsOptionsByCustomfieldoptionRoute

{- | DELETE /enterprises/{id}/organizations/{idOrganization}
     Remove an member as admin from an enterprise.
 -}
deleteEnterprisesOrganizationsByOrganization :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteEnterprisesOrganizationsByOrganization x0 x1  = deleteEnterprisesOrganizationsByOrganization' (coerce x0) (coerce x1)  where
  deleteEnterprisesOrganizationsByOrganization' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteEnterprisesOrganizationsByOrganizationRoute

{- | DELETE /labels/{id}
     Delete a label by ID.
 -}
deleteLabels :: TrelloRESTClientMonad m => Text -> m ()
deleteLabels x0  = deleteLabels' (coerce x0)  where
  deleteLabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteLabelsRoute

{- | DELETE /members/{id}/boardBackgrounds/{idBackground}
     Delete a board background
 -}
deleteMembersBoardbackgroundsByBackground :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteMembersBoardbackgroundsByBackground x0 x1  = deleteMembersBoardbackgroundsByBackground' (coerce x0) (coerce x1)  where
  deleteMembersBoardbackgroundsByBackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteMembersBoardbackgroundsByBackgroundRoute

{- | DELETE /members/{id}/boardStars/{idStar}
     Unstar a board
 -}
deleteMembersBoardstarsByStar :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteMembersBoardstarsByStar x0 x1  = deleteMembersBoardstarsByStar' (coerce x0) (coerce x1)  where
  deleteMembersBoardstarsByStar' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteMembersBoardstarsByStarRoute

{- | DELETE /members/{id}/customBoardBackgrounds/{idBackground}
     Delete a custom board background
 -}
deleteMembersCustomboardbackgroundsByBackground :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteMembersCustomboardbackgroundsByBackground x0 x1  = deleteMembersCustomboardbackgroundsByBackground' (coerce x0) (coerce x1)  where
  deleteMembersCustomboardbackgroundsByBackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteMembersCustomboardbackgroundsByBackgroundRoute

{- | DELETE /members/{id}/customStickers/{idSticker}
     Delete a custom sticker
 -}
deleteMembersCustomstickersBySticker :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteMembersCustomstickersBySticker x0 x1  = deleteMembersCustomstickersBySticker' (coerce x0) (coerce x1)  where
  deleteMembersCustomstickersBySticker' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteMembersCustomstickersByStickerRoute

{- | DELETE /members/{id}/savedSearches/{idSearch}
     Delete a saved search
 -}
deleteMembersSavedsearchesBySearch :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteMembersSavedsearchesBySearch x0 x1  = deleteMembersSavedsearchesBySearch' (coerce x0) (coerce x1)  where
  deleteMembersSavedsearchesBySearch' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteMembersSavedsearchesBySearchRoute

{- | DELETE /organizations/{id}
     Delete a team
 -}
deleteOrganizations :: TrelloRESTClientMonad m => Text -> m ()
deleteOrganizations x0  = deleteOrganizations' (coerce x0)  where
  deleteOrganizations' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteOrganizationsRoute

{- | DELETE /organizations/{id}/logo
     Delete a the logo from a team
 -}
deleteOrganizationsLogo :: TrelloRESTClientMonad m => Text -> m ()
deleteOrganizationsLogo x0  = deleteOrganizationsLogo' (coerce x0)  where
  deleteOrganizationsLogo' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteOrganizationsLogoRoute

{- | DELETE /organizations/{id}/members/{idMember}/all
     Remove a member from a team and from all team boards
 -}
deleteOrganizationsMembersAllByMember :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteOrganizationsMembersAllByMember x0 x1  = deleteOrganizationsMembersAllByMember' (coerce x0) (coerce x1)  where
  deleteOrganizationsMembersAllByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteOrganizationsMembersAllByMemberRoute

{- | DELETE /organizations/{id}/members/{idMember}
     Remove a member from a team
 -}
deleteOrganizationsMembersByMember :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteOrganizationsMembersByMember x0 x1  = deleteOrganizationsMembersByMember' (coerce x0) (coerce x1)  where
  deleteOrganizationsMembersByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteOrganizationsMembersByMemberRoute

{- | DELETE /organizations/{id}/prefs/associatedDomain
     Remove the associated Google Apps domain from a team
 -}
deleteOrganizationsPrefsAssociateddomain :: TrelloRESTClientMonad m => Text -> m ()
deleteOrganizationsPrefsAssociateddomain x0  = deleteOrganizationsPrefsAssociateddomain' (coerce x0)  where
  deleteOrganizationsPrefsAssociateddomain' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteOrganizationsPrefsAssociateddomainRoute

{- | DELETE /organizations/{id}/prefs/orgInviteRestrict
     Remove the email domain restriction on who can be invited to the team
 -}
deleteOrganizationsPrefsOrginviterestrict :: TrelloRESTClientMonad m => Text -> m ()
deleteOrganizationsPrefsOrginviterestrict x0  = deleteOrganizationsPrefsOrginviterestrict' (coerce x0)  where
  deleteOrganizationsPrefsOrginviterestrict' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteOrganizationsPrefsOrginviterestrictRoute

{- | DELETE /organizations/{id}/tags/{idTag}
     Delete an organization's tag
 -}
deleteOrganizationsTagsByTag :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteOrganizationsTagsByTag x0 x1  = deleteOrganizationsTagsByTag' (coerce x0) (coerce x1)  where
  deleteOrganizationsTagsByTag' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteOrganizationsTagsByTagRoute

{- | DELETE /tokens/{token}/
     Delete a token.
 -}
deleteTokens :: TrelloRESTClientMonad m => Text -> m ()
deleteTokens x0  = deleteTokens' (coerce x0)  where
  deleteTokens' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteTokensRoute

{- | DELETE /tokens/{token}/webhooks/{idWebhook}
     Delete a webhook created with given token.
 -}
deleteTokensWebhooksByTokenWebhook :: TrelloRESTClientMonad m => Text -> Text -> m ()
deleteTokensWebhooksByTokenWebhook x0 x1  = deleteTokensWebhooksByTokenWebhook' (coerce x0) (coerce x1)  where
  deleteTokensWebhooksByTokenWebhook' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteTokensWebhooksByTokenWebhookRoute

{- | DELETE /webhooks/{id}
     Delete a webhook by ID.
 -}
deleteWebhooks :: TrelloRESTClientMonad m => Text -> m ()
deleteWebhooks x0  = deleteWebhooks' (coerce x0)  where
  deleteWebhooks' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy DeleteWebhooksRoute

{- | GET /actions/{id}
     Get information about an action
 -}
getActions :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
getActions x0 x1 x2 x3 x4 x5 x6 x7  = getActions' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7)  where
  getActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsRoute

{- | GET /actions/{id}/board
     Get the board for an action
 -}
getActionsBoard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getActionsBoard x0 x1  = getActionsBoard' (coerce x0) (coerce x1)  where
  getActionsBoard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsBoardRoute

{- | GET /actions/{id}/{field}
     Get a specific property of an action
 -}
getActionsByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getActionsByField x0 x1  = getActionsByField' (coerce x0) (coerce x1)  where
  getActionsByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsByFieldRoute

{- | GET /actions/{id}/card
     Get the card for an action
 -}
getActionsCard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getActionsCard x0 x1  = getActionsCard' (coerce x0) (coerce x1)  where
  getActionsCard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsCardRoute

{- | GET /actions/{id}/display
     Get the display information for an action.
 -}
getActionsDisplay :: TrelloRESTClientMonad m => Text -> m ()
getActionsDisplay x0  = getActionsDisplay' (coerce x0)  where
  getActionsDisplay' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsDisplayRoute

{- | GET /actions/{id}/list
     Get the list for an action
 -}
getActionsList :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getActionsList x0 x1  = getActionsList' (coerce x0) (coerce x1)  where
  getActionsList' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsListRoute

{- | GET /actions/{id}/member
     Gets the member of an action (not the creator)
 -}
getActionsMember :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getActionsMember x0 x1  = getActionsMember' (coerce x0) (coerce x1)  where
  getActionsMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsMemberRoute

{- | GET /actions/{id}/memberCreator
     Gets the member who created the action
 -}
getActionsMembercreator :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getActionsMembercreator x0 x1  = getActionsMembercreator' (coerce x0) (coerce x1)  where
  getActionsMembercreator' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsMembercreatorRoute

{- | GET /actions/{id}/organization
     Get the organization of an action
 -}
getActionsOrganization :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getActionsOrganization x0 x1  = getActionsOrganization' (coerce x0) (coerce x1)  where
  getActionsOrganization' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsOrganizationRoute

{- | GET /actions/{idAction}/reactions
     List reactions for an action
 -}
getActionsReactions :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> m ()
getActionsReactions x0 x1 x2  = getActionsReactions' (coerce x0) (coerce x1) (coerce x2)  where
  getActionsReactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsReactionsRoute

{- | GET /actions/{idAction}/reactions/{id}
     Get information for a reaction
 -}
getActionsReactionsByAction :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> Maybe Bool -> m ()
getActionsReactionsByAction x0 x1 x2 x3  = getActionsReactionsByAction' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  getActionsReactionsByAction' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsReactionsByActionRoute

{- | GET /actions/{idAction}/reactionsSummary
     List a summary of all reactions for an action
 -}
getActionsReactionssummary :: TrelloRESTClientMonad m => Text -> m ()
getActionsReactionssummary x0  = getActionsReactionssummary' (coerce x0)  where
  getActionsReactionssummary' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetActionsReactionssummaryRoute

{- | GET /batch
     
 -}
getBatch :: TrelloRESTClientMonad m => Maybe Text -> m ()
getBatch x0  = getBatch' (coerce x0)  where
  getBatch' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBatchRoute

{- | GET /boards/{id}
     Request a single board.
 -}
getBoards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> m ()
getBoards x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18  = getBoards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18)  where
  getBoards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsRoute

{- | GET /boards/{boardId}/actions
     
 -}
getBoardsActions :: TrelloRESTClientMonad m => Text -> m ()
getBoardsActions x0  = getBoardsActions' (coerce x0)  where
  getBoardsActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsActionsRoute

{- | GET /boards/{id}/boardPlugins
     Get the enabled Power-Ups on a board
 -}
getBoardsBoardplugins :: TrelloRESTClientMonad m => Text -> m ()
getBoardsBoardplugins x0  = getBoardsBoardplugins' (coerce x0)  where
  getBoardsBoardplugins' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsBoardpluginsRoute

{- | GET /boards/{boardId}/boardStars
     
 -}
getBoardsBoardstars :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getBoardsBoardstars x0 x1  = getBoardsBoardstars' (coerce x0) (coerce x1)  where
  getBoardsBoardstars' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsBoardstarsRoute

{- | GET /boards/{id}/{field}
     
 -}
getBoardsByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getBoardsByField x0 x1  = getBoardsByField' (coerce x0) (coerce x1)  where
  getBoardsByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsByFieldRoute

{- | GET /boards/{id}/cards
     
 -}
getBoardsCards :: TrelloRESTClientMonad m => Text -> m ()
getBoardsCards x0  = getBoardsCards' (coerce x0)  where
  getBoardsCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsCardsRoute

{- | GET /boards/{boardId}/cards/{filter}
     
 -}
getBoardsCardsByBoardidFilter :: TrelloRESTClientMonad m => Text -> Text -> m ()
getBoardsCardsByBoardidFilter x0 x1  = getBoardsCardsByBoardidFilter' (coerce x0) (coerce x1)  where
  getBoardsCardsByBoardidFilter' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsCardsByBoardidFilterRoute

{- | GET /boards/{id}/cards/{idCard}
     
 -}
getBoardsCardsByCard :: TrelloRESTClientMonad m => Text -> Text -> m ()
getBoardsCardsByCard x0 x1  = getBoardsCardsByCard' (coerce x0) (coerce x1)  where
  getBoardsCardsByCard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsCardsByCardRoute

{- | GET /boards/{id}/checklists
     
 -}
getBoardsChecklists :: TrelloRESTClientMonad m => Text -> m ()
getBoardsChecklists x0  = getBoardsChecklists' (coerce x0)  where
  getBoardsChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsChecklistsRoute

{- | GET /boards/{id}/customFields
     Get the Custom Field Definitions that exist on a board.
 -}
getBoardsCustomfields :: TrelloRESTClientMonad m => Text -> m ()
getBoardsCustomfields x0  = getBoardsCustomfields' (coerce x0)  where
  getBoardsCustomfields' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsCustomfieldsRoute

{- | GET /boards/{id}/labels
     
 -}
getBoardsLabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Int -> m ()
getBoardsLabels x0 x1 x2  = getBoardsLabels' (coerce x0) (coerce x1) (coerce x2)  where
  getBoardsLabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsLabelsRoute

{- | GET /boards/{id}/lists
     
 -}
getBoardsLists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
getBoardsLists x0 x1 x2 x3 x4  = getBoardsLists' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  getBoardsLists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsListsRoute

{- | GET /boards/{id}/lists/{filter}
     
 -}
getBoardsListsByFilter :: TrelloRESTClientMonad m => Text -> Text -> m ()
getBoardsListsByFilter x0 x1  = getBoardsListsByFilter' (coerce x0) (coerce x1)  where
  getBoardsListsByFilter' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsListsByFilterRoute

{- | GET /boards/{id}/members
     Get the members for a board
 -}
getBoardsMembers :: TrelloRESTClientMonad m => Text -> m ()
getBoardsMembers x0  = getBoardsMembers' (coerce x0)  where
  getBoardsMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsMembersRoute

{- | GET /boards/{id}/memberships
     Get information about the memberships users have to the board.
 -}
getBoardsMemberships :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Text -> m ()
getBoardsMemberships x0 x1 x2 x3 x4 x5  = getBoardsMemberships' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  getBoardsMemberships' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsMembershipsRoute

{- | GET /boards/{id}/plugins
     List the Power-Ups for a board
 -}
getBoardsPlugins :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getBoardsPlugins x0 x1  = getBoardsPlugins' (coerce x0) (coerce x1)  where
  getBoardsPlugins' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsPluginsRoute

{- | GET /boards/{id}/tags
     
 -}
getBoardsTags :: TrelloRESTClientMonad m => Text -> m ()
getBoardsTags x0  = getBoardsTags' (coerce x0)  where
  getBoardsTags' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetBoardsTagsRoute

{- | GET /cards/{id}
     Get a card by its ID
 -}
getCards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> m ()
getCards x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18  = getCards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18)  where
  getCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsRoute

{- | GET /cards/{id}/actions
     List the actions on a card
 -}
getCardsActions :: TrelloRESTClientMonad m => Text -> m ()
getCardsActions x0  = getCardsActions' (coerce x0)  where
  getCardsActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsActionsRoute

{- | GET /cards/{id}/attachments
     List the attachments on a card
 -}
getCardsAttachments :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
getCardsAttachments x0 x1 x2  = getCardsAttachments' (coerce x0) (coerce x1) (coerce x2)  where
  getCardsAttachments' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsAttachmentsRoute

{- | GET /cards/{id}/attachments/{idAttachment}
     Get a specific attachment on a card
 -}
getCardsAttachmentsByAttachment :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getCardsAttachmentsByAttachment x0 x1 x2  = getCardsAttachmentsByAttachment' (coerce x0) (coerce x1) (coerce x2)  where
  getCardsAttachmentsByAttachment' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsAttachmentsByAttachmentRoute

{- | GET /cards/{id}/board
     Get the board a card is on
 -}
getCardsBoard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getCardsBoard x0 x1  = getCardsBoard' (coerce x0) (coerce x1)  where
  getCardsBoard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsBoardRoute

{- | GET /cards/{id}/{field}
     Get a specific property of a card
 -}
getCardsByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getCardsByField x0 x1  = getCardsByField' (coerce x0) (coerce x1)  where
  getCardsByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsByFieldRoute

{- | GET /cards/{id}/checkItem/{idCheckItem}
     Get a specific checkItem on a card
 -}
getCardsCheckitemByCheckitem :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getCardsCheckitemByCheckitem x0 x1 x2  = getCardsCheckitemByCheckitem' (coerce x0) (coerce x1) (coerce x2)  where
  getCardsCheckitemByCheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsCheckitemByCheckitemRoute

{- | GET /cards/{id}/checkItemStates
     Get the completed checklist items on a card
 -}
getCardsCheckitemstates :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getCardsCheckitemstates x0 x1  = getCardsCheckitemstates' (coerce x0) (coerce x1)  where
  getCardsCheckitemstates' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsCheckitemstatesRoute

{- | GET /cards/{id}/checklists
     Get the checklists on a card
 -}
getCardsChecklists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
getCardsChecklists x0 x1 x2 x3 x4  = getCardsChecklists' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  getCardsChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsChecklistsRoute

{- | GET /cards/{id}/customFieldItems
     Get the custom field items for a card.
 -}
getCardsCustomfielditems :: TrelloRESTClientMonad m => Text -> m ()
getCardsCustomfielditems x0  = getCardsCustomfielditems' (coerce x0)  where
  getCardsCustomfielditems' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsCustomfielditemsRoute

{- | GET /cards/{id}/list
     Get the list a card is in
 -}
getCardsList :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getCardsList x0 x1  = getCardsList' (coerce x0) (coerce x1)  where
  getCardsList' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsListRoute

{- | GET /cards/{id}/members
     Get the members on a card
 -}
getCardsMembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getCardsMembers x0 x1  = getCardsMembers' (coerce x0) (coerce x1)  where
  getCardsMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsMembersRoute

{- | GET /cards/{id}/membersVoted
     Get the members who have voted on a card
 -}
getCardsMembersvoted :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getCardsMembersvoted x0 x1  = getCardsMembersvoted' (coerce x0) (coerce x1)  where
  getCardsMembersvoted' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsMembersvotedRoute

{- | GET /cards/{id}/pluginData
     Get any shared pluginData on a card
 -}
getCardsPlugindata :: TrelloRESTClientMonad m => Text -> m ()
getCardsPlugindata x0  = getCardsPlugindata' (coerce x0)  where
  getCardsPlugindata' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsPlugindataRoute

{- | GET /cards/{id}/stickers
     Get the stickers on a card
 -}
getCardsStickers :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getCardsStickers x0 x1  = getCardsStickers' (coerce x0) (coerce x1)  where
  getCardsStickers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsStickersRoute

{- | GET /cards/{id}/stickers/{idSticker}
     Get a specific sticker on a card
 -}
getCardsStickersBySticker :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getCardsStickersBySticker x0 x1 x2  = getCardsStickersBySticker' (coerce x0) (coerce x1) (coerce x2)  where
  getCardsStickersBySticker' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCardsStickersByStickerRoute

{- | GET /checklists/{id}
     
 -}
getChecklists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
getChecklists x0 x1 x2 x3 x4  = getChecklists' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  getChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetChecklistsRoute

{- | GET /checklists/{id}/board
     
 -}
getChecklistsBoard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getChecklistsBoard x0 x1  = getChecklistsBoard' (coerce x0) (coerce x1)  where
  getChecklistsBoard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetChecklistsBoardRoute

{- | GET /checklists/{id}/{field}
     
 -}
getChecklistsByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getChecklistsByField x0 x1  = getChecklistsByField' (coerce x0) (coerce x1)  where
  getChecklistsByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetChecklistsByFieldRoute

{- | GET /checklists/{id}/cards
     
 -}
getChecklistsCards :: TrelloRESTClientMonad m => Text -> m ()
getChecklistsCards x0  = getChecklistsCards' (coerce x0)  where
  getChecklistsCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetChecklistsCardsRoute

{- | GET /checklists/{id}/checkItems
     
 -}
getChecklistsCheckitems :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
getChecklistsCheckitems x0 x1 x2  = getChecklistsCheckitems' (coerce x0) (coerce x1) (coerce x2)  where
  getChecklistsCheckitems' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetChecklistsCheckitemsRoute

{- | GET /checklists/{id}/checkItems/{idCheckItem}
     
 -}
getChecklistsCheckitemsByCheckitem :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getChecklistsCheckitemsByCheckitem x0 x1 x2  = getChecklistsCheckitemsByCheckitem' (coerce x0) (coerce x1) (coerce x2)  where
  getChecklistsCheckitemsByCheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetChecklistsCheckitemsByCheckitemRoute

{- | GET /customfields/{id}
     
 -}
getCustomfields :: TrelloRESTClientMonad m => Text -> m ()
getCustomfields x0  = getCustomfields' (coerce x0)  where
  getCustomfields' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCustomfieldsRoute

{- | GET /customFields/{id}/options
     Get the options of a drop down Custom Field
 -}
getCustomfieldsOptions :: TrelloRESTClientMonad m => Text -> m ()
getCustomfieldsOptions x0  = getCustomfieldsOptions' (coerce x0)  where
  getCustomfieldsOptions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCustomfieldsOptionsRoute

{- | GET /customFields/{id}/options/{idCustomFieldOption}
     
 -}
getCustomfieldsOptionsByCustomfieldoption :: TrelloRESTClientMonad m => Text -> Text -> m ()
getCustomfieldsOptionsByCustomfieldoption x0 x1  = getCustomfieldsOptionsByCustomfieldoption' (coerce x0) (coerce x1)  where
  getCustomfieldsOptionsByCustomfieldoption' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetCustomfieldsOptionsByCustomfieldoptionRoute

{- | GET /emoji
     List available emoji
 -}
getEmoji :: TrelloRESTClientMonad m => Maybe Text -> Maybe Bool -> m ()
getEmoji x0 x1  = getEmoji' (coerce x0) (coerce x1)  where
  getEmoji' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetEmojiRoute

{- | GET /enterprises/{id}
     Get an enterprise by its ID.
 -}
getEnterprises :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
getEnterprises x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13  = getEnterprises' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13)  where
  getEnterprises' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetEnterprisesRoute

{- | GET /enterprises/{id}/admins
     Get an enterprise's admin members.
 -}
getEnterprisesAdmins :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getEnterprisesAdmins x0 x1  = getEnterprisesAdmins' (coerce x0) (coerce x1)  where
  getEnterprisesAdmins' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetEnterprisesAdminsRoute

{- | GET /enterprises/{id}/members
     Get the members of an enterprise.
 -}
getEnterprisesMembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
getEnterprisesMembers x0 x1 x2 x3 x4 x5 x6 x7 x8 x9  = getEnterprisesMembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9)  where
  getEnterprisesMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetEnterprisesMembersRoute

{- | GET /enterprises/{id}/members/{idMember}
     Get a specific member of an enterprise by ID.
 -}
getEnterprisesMembersByMember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
getEnterprisesMembersByMember x0 x1 x2 x3 x4  = getEnterprisesMembersByMember' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  getEnterprisesMembersByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetEnterprisesMembersByMemberRoute

{- | GET /enterprises/{id}/signupUrl
     Get the signup URL for an enterprise.
 -}
getEnterprisesSignupurl :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> m ()
getEnterprisesSignupurl x0 x1 x2 x3 x4  = getEnterprisesSignupurl' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  getEnterprisesSignupurl' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetEnterprisesSignupurlRoute

{- | GET /enterprises/{id}/transferrable/organization/{idOrganization}
     Get whether an organization can be transferred to an enterprise.
 -}
getEnterprisesTransferrableOrganizationByOrganization :: TrelloRESTClientMonad m => Text -> Text -> m ()
getEnterprisesTransferrableOrganizationByOrganization x0 x1  = getEnterprisesTransferrableOrganizationByOrganization' (coerce x0) (coerce x1)  where
  getEnterprisesTransferrableOrganizationByOrganization' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetEnterprisesTransferrableOrganizationByOrganizationRoute

{- | GET /labels/{id}
     Get information about a label by ID.
 -}
getLabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getLabels x0 x1  = getLabels' (coerce x0) (coerce x1)  where
  getLabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetLabelsRoute

{- | GET /lists/{id}
     Get information about a list
 -}
getLists :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getLists x0 x1  = getLists' (coerce x0) (coerce x1)  where
  getLists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetListsRoute

{- | GET /lists/{id}/actions
     List the actions on a list
 -}
getListsActions :: TrelloRESTClientMonad m => Text -> m ()
getListsActions x0  = getListsActions' (coerce x0)  where
  getListsActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetListsActionsRoute

{- | GET /lists/{id}/board
     Get the board a list is on
 -}
getListsBoard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getListsBoard x0 x1  = getListsBoard' (coerce x0) (coerce x1)  where
  getListsBoard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetListsBoardRoute

{- | GET /lists/{id}/{field}
     Get a specific property of a list
 -}
getListsByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getListsByField x0 x1  = getListsByField' (coerce x0) (coerce x1)  where
  getListsByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetListsByFieldRoute

{- | GET /lists/{id}/cards
     List the cards in a list
 -}
getListsCards :: TrelloRESTClientMonad m => Text -> m ()
getListsCards x0  = getListsCards' (coerce x0)  where
  getListsCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetListsCardsRoute

{- | GET /members/{id}
     Get a member
 -}
getMembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> m ()
getMembers x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20  = getMembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18) (coerce x19) (coerce x20)  where
  getMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersRoute

{- | GET /members/{id}/actions
     List the actions for a member
 -}
getMembersActions :: TrelloRESTClientMonad m => Text -> m ()
getMembersActions x0  = getMembersActions' (coerce x0)  where
  getMembersActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersActionsRoute

{- | GET /members/{id}/boardBackgrounds
     Get a member's custom board backgrounds
 -}
getMembersBoardbackgrounds :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getMembersBoardbackgrounds x0 x1  = getMembersBoardbackgrounds' (coerce x0) (coerce x1)  where
  getMembersBoardbackgrounds' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersBoardbackgroundsRoute

{- | GET /members/{id}/boardBackgrounds/{idBackground}
     Get a member's board background
 -}
getMembersBoardbackgroundsByBackground :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getMembersBoardbackgroundsByBackground x0 x1 x2  = getMembersBoardbackgroundsByBackground' (coerce x0) (coerce x1) (coerce x2)  where
  getMembersBoardbackgroundsByBackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersBoardbackgroundsByBackgroundRoute

{- | GET /members/{id}/boards
     Lists the boards a member has access to
 -}
getMembersBoards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
getMembersBoards x0 x1 x2 x3 x4 x5 x6  = getMembersBoards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6)  where
  getMembersBoards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersBoardsRoute

{- | GET /members/{id}/boardsInvited
     Get the boards the member has been invited to
 -}
getMembersBoardsinvited :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getMembersBoardsinvited x0 x1  = getMembersBoardsinvited' (coerce x0) (coerce x1)  where
  getMembersBoardsinvited' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersBoardsinvitedRoute

{- | GET /members/{id}/boardStars
     List a member's board stars
 -}
getMembersBoardstars :: TrelloRESTClientMonad m => Text -> m ()
getMembersBoardstars x0  = getMembersBoardstars' (coerce x0)  where
  getMembersBoardstars' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersBoardstarsRoute

{- | GET /members/{id}/boardStars/{idStar}
     Get a specific boardStar
 -}
getMembersBoardstarsByStar :: TrelloRESTClientMonad m => Text -> Text -> m ()
getMembersBoardstarsByStar x0 x1  = getMembersBoardstarsByStar' (coerce x0) (coerce x1)  where
  getMembersBoardstarsByStar' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersBoardstarsByStarRoute

{- | GET /members/{id}/{field}
     Get a particular property of a member
 -}
getMembersByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getMembersByField x0 x1  = getMembersByField' (coerce x0) (coerce x1)  where
  getMembersByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersByFieldRoute

{- | GET /members/{id}/cards
     Gets the cards a member is on
 -}
getMembersCards :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getMembersCards x0 x1  = getMembersCards' (coerce x0) (coerce x1)  where
  getMembersCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersCardsRoute

{- | GET /members/{id}/customBoardBackgrounds
     Get a member's custom board backgrounds
 -}
getMembersCustomboardbackgrounds :: TrelloRESTClientMonad m => Text -> m ()
getMembersCustomboardbackgrounds x0  = getMembersCustomboardbackgrounds' (coerce x0)  where
  getMembersCustomboardbackgrounds' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersCustomboardbackgroundsRoute

{- | GET /members/{id}/customBoardBackgrounds/{idBackground}
     Get a specific custom board background
 -}
getMembersCustomboardbackgroundsByBackground :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getMembersCustomboardbackgroundsByBackground x0 x1 x2  = getMembersCustomboardbackgroundsByBackground' (coerce x0) (coerce x1) (coerce x2)  where
  getMembersCustomboardbackgroundsByBackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersCustomboardbackgroundsByBackgroundRoute

{- | GET /members/{id}/customEmoji
     Get a member's uploaded custom emoji
 -}
getMembersCustomemoji :: TrelloRESTClientMonad m => Text -> m ()
getMembersCustomemoji x0  = getMembersCustomemoji' (coerce x0)  where
  getMembersCustomemoji' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersCustomemojiRoute

{- | GET /members/{id}/customEmoji/{idEmoji}
     Get a custom emoji
 -}
getMembersCustomemojiByEmoji :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getMembersCustomemojiByEmoji x0 x1 x2  = getMembersCustomemojiByEmoji' (coerce x0) (coerce x1) (coerce x2)  where
  getMembersCustomemojiByEmoji' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersCustomemojiByEmojiRoute

{- | GET /members/{id}/customStickers
     Get a member's uploaded stickers
 -}
getMembersCustomstickers :: TrelloRESTClientMonad m => Text -> m ()
getMembersCustomstickers x0  = getMembersCustomstickers' (coerce x0)  where
  getMembersCustomstickers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersCustomstickersRoute

{- | GET /members/{id}/customStickers/{idSticker}
     Get the enterprises that a member belongs to.
 -}
getMembersCustomstickersBySticker :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
getMembersCustomstickersBySticker x0 x1 x2  = getMembersCustomstickersBySticker' (coerce x0) (coerce x1) (coerce x2)  where
  getMembersCustomstickersBySticker' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersCustomstickersByStickerRoute

{- | GET /members/{id}/notifications
     Get a member's notifications
 -}
getMembersNotifications :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
getMembersNotifications x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11  = getMembersNotifications' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11)  where
  getMembersNotifications' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersNotificationsRoute

{- | GET /members/{id}/organizations
     Get a member's teams
 -}
getMembersOrganizations :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
getMembersOrganizations x0 x1 x2 x3  = getMembersOrganizations' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  getMembersOrganizations' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersOrganizationsRoute

{- | GET /members/{id}/organizationsInvited
     Get a member's teams they have been invited to
 -}
getMembersOrganizationsinvited :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getMembersOrganizationsinvited x0 x1  = getMembersOrganizationsinvited' (coerce x0) (coerce x1)  where
  getMembersOrganizationsinvited' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersOrganizationsinvitedRoute

{- | GET /members/{id}/savedSearches
     List the saved searches of a member
 -}
getMembersSavedsearches :: TrelloRESTClientMonad m => Text -> m ()
getMembersSavedsearches x0  = getMembersSavedsearches' (coerce x0)  where
  getMembersSavedsearches' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersSavedsearchesRoute

{- | GET /members/{id}/savedSearches/{idSearch}
     Get a saved search
 -}
getMembersSavedsearchesBySearch :: TrelloRESTClientMonad m => Text -> Text -> m ()
getMembersSavedsearchesBySearch x0 x1  = getMembersSavedsearchesBySearch' (coerce x0) (coerce x1)  where
  getMembersSavedsearchesBySearch' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersSavedsearchesBySearchRoute

{- | GET /members/{id}/tokens
     List a members app tokens
 -}
getMembersTokens :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
getMembersTokens x0 x1  = getMembersTokens' (coerce x0) (coerce x1)  where
  getMembersTokens' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetMembersTokensRoute

{- | GET /notifications/{id}
     
 -}
getNotifications :: TrelloRESTClientMonad m => Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Bool -> Maybe Text -> m ()
getNotifications x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14  = getNotifications' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14)  where
  getNotifications' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsRoute

{- | GET /notifications/{id}/board
     Get the board a notification is associated with
 -}
getNotificationsBoard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getNotificationsBoard x0 x1  = getNotificationsBoard' (coerce x0) (coerce x1)  where
  getNotificationsBoard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsBoardRoute

{- | GET /notifications/{id}/{field}
     Get a specific property of a notification
 -}
getNotificationsByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getNotificationsByField x0 x1  = getNotificationsByField' (coerce x0) (coerce x1)  where
  getNotificationsByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsByFieldRoute

{- | GET /notifications/{id}/card
     Get the card a notification is associated with
 -}
getNotificationsCard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getNotificationsCard x0 x1  = getNotificationsCard' (coerce x0) (coerce x1)  where
  getNotificationsCard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsCardRoute

{- | GET /notifications/{id}/list
     Get the list a notification is associated with
 -}
getNotificationsList :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getNotificationsList x0 x1  = getNotificationsList' (coerce x0) (coerce x1)  where
  getNotificationsList' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsListRoute

{- | GET /notifications/{id}/member
     Get the member (not the creator) a notification is about
 -}
getNotificationsMember :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getNotificationsMember x0 x1  = getNotificationsMember' (coerce x0) (coerce x1)  where
  getNotificationsMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsMemberRoute

{- | GET /notifications/{id}/memberCreator
     Get the member who created the notification
 -}
getNotificationsMembercreator :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getNotificationsMembercreator x0 x1  = getNotificationsMembercreator' (coerce x0) (coerce x1)  where
  getNotificationsMembercreator' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsMembercreatorRoute

{- | GET /notifications/{id}/organization
     Get the organization a notification is associated with
 -}
getNotificationsOrganization :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getNotificationsOrganization x0 x1  = getNotificationsOrganization' (coerce x0) (coerce x1)  where
  getNotificationsOrganization' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetNotificationsOrganizationRoute

{- | GET /organizations/{id}
     
 -}
getOrganizations :: TrelloRESTClientMonad m => Text -> m ()
getOrganizations x0  = getOrganizations' (coerce x0)  where
  getOrganizations' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsRoute

{- | GET /organizations/{id}/actions
     List the actions on a team
 -}
getOrganizationsActions :: TrelloRESTClientMonad m => Text -> m ()
getOrganizationsActions x0  = getOrganizationsActions' (coerce x0)  where
  getOrganizationsActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsActionsRoute

{- | GET /organizations/{id}/boards
     List the boards in a team
 -}
getOrganizationsBoards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
getOrganizationsBoards x0 x1 x2  = getOrganizationsBoards' (coerce x0) (coerce x1) (coerce x2)  where
  getOrganizationsBoards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsBoardsRoute

{- | GET /organizations/{id}/{field}
     
 -}
getOrganizationsByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getOrganizationsByField x0 x1  = getOrganizationsByField' (coerce x0) (coerce x1)  where
  getOrganizationsByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsByFieldRoute

{- | GET /organizations/{id}/exports
     Retrieve the exports that exist for the given organization
 -}
getOrganizationsExports :: TrelloRESTClientMonad m => Text -> m ()
getOrganizationsExports x0  = getOrganizationsExports' (coerce x0)  where
  getOrganizationsExports' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsExportsRoute

{- | GET /organizations/{id}/members
     List the members in a team
 -}
getOrganizationsMembers :: TrelloRESTClientMonad m => Text -> m ()
getOrganizationsMembers x0  = getOrganizationsMembers' (coerce x0)  where
  getOrganizationsMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsMembersRoute

{- | GET /organizations/{id}/members/{filter}
     
 -}
getOrganizationsMembersByFilter :: TrelloRESTClientMonad m => Text -> Text -> m ()
getOrganizationsMembersByFilter x0 x1  = getOrganizationsMembersByFilter' (coerce x0) (coerce x1)  where
  getOrganizationsMembersByFilter' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsMembersByFilterRoute

{- | GET /organizations/{id}/memberships
     List the memberships of a team
 -}
getOrganizationsMemberships :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> m ()
getOrganizationsMemberships x0 x1 x2  = getOrganizationsMemberships' (coerce x0) (coerce x1) (coerce x2)  where
  getOrganizationsMemberships' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsMembershipsRoute

{- | GET /organizations/{id}/memberships/{idMembership}
     List the memberships of a team
 -}
getOrganizationsMembershipsByMembership :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> m ()
getOrganizationsMembershipsByMembership x0 x1 x2  = getOrganizationsMembershipsByMembership' (coerce x0) (coerce x1) (coerce x2)  where
  getOrganizationsMembershipsByMembership' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsMembershipsByMembershipRoute

{- | GET /organizations/{id}/membersInvited
     List the members with pending invites to a team
 -}
getOrganizationsMembersinvited :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getOrganizationsMembersinvited x0 x1  = getOrganizationsMembersinvited' (coerce x0) (coerce x1)  where
  getOrganizationsMembersinvited' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsMembersinvitedRoute

{- | GET /organizations/{id}/newBillableGuests/{idBoard}
     Used to check whether the given board has new billable guests on it.
 -}
getOrganizationsNewbillableguestsByBoard :: TrelloRESTClientMonad m => Text -> Text -> m ()
getOrganizationsNewbillableguestsByBoard x0 x1  = getOrganizationsNewbillableguestsByBoard' (coerce x0) (coerce x1)  where
  getOrganizationsNewbillableguestsByBoard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsNewbillableguestsByBoardRoute

{- | GET /organizations/{id}/pluginData
     Get organization scoped pluginData on this team
 -}
getOrganizationsPlugindata :: TrelloRESTClientMonad m => Text -> m ()
getOrganizationsPlugindata x0  = getOrganizationsPlugindata' (coerce x0)  where
  getOrganizationsPlugindata' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsPlugindataRoute

{- | GET /organizations/{id}/tags
     List the organization's collections
 -}
getOrganizationsTags :: TrelloRESTClientMonad m => Text -> m ()
getOrganizationsTags x0  = getOrganizationsTags' (coerce x0)  where
  getOrganizationsTags' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetOrganizationsTagsRoute

{- | GET /search
     Find what you're looking for in Trello
 -}
getSearch :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Text -> Maybe Int -> Maybe Int -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Int -> Maybe Text -> Maybe Int -> Maybe Bool -> m ()
getSearch x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19  = getSearch' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18) (coerce x19)  where
  getSearch' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetSearchRoute

{- | GET /search/members/
     Search for Trello members
 -}
getSearchMembers :: TrelloRESTClientMonad m => Maybe Text -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
getSearchMembers x0 x1 x2 x3 x4  = getSearchMembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  getSearchMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetSearchMembersRoute

{- | GET /tokens/{token}
     Retrieve information about a token.
 -}
getTokens :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> m ()
getTokens x0 x1 x2  = getTokens' (coerce x0) (coerce x1) (coerce x2)  where
  getTokens' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetTokensRoute

{- | GET /tokens/{token}/member
     Retrieve information about a token's owner by token.
 -}
getTokensMember :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
getTokensMember x0 x1  = getTokensMember' (coerce x0) (coerce x1)  where
  getTokensMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetTokensMemberRoute

{- | GET /tokens/{token}/webhooks
     Retrieve all webhooks created with a token.
 -}
getTokensWebhooks :: TrelloRESTClientMonad m => Text -> m ()
getTokensWebhooks x0  = getTokensWebhooks' (coerce x0)  where
  getTokensWebhooks' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetTokensWebhooksRoute

{- | GET /tokens/{token}/webhooks/{idWebhook}
     Retrieve a webhook created with a token.
 -}
getTokensWebhooksByTokenWebhook :: TrelloRESTClientMonad m => Text -> Text -> m ()
getTokensWebhooksByTokenWebhook x0 x1  = getTokensWebhooksByTokenWebhook' (coerce x0) (coerce x1)  where
  getTokensWebhooksByTokenWebhook' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetTokensWebhooksByTokenWebhookRoute

{- | GET /webhooks/{id}
     Get a webhook by ID.
 -}
getWebhooks :: TrelloRESTClientMonad m => Text -> m ()
getWebhooks x0  = getWebhooks' (coerce x0)  where
  getWebhooks' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetWebhooksRoute

{- | GET /webhooks/{id}/{field}
     Get a webhook's field.
 -}
getWebhooksByField :: TrelloRESTClientMonad m => Text -> Text -> m ()
getWebhooksByField x0 x1  = getWebhooksByField' (coerce x0) (coerce x1)  where
  getWebhooksByField' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy GetWebhooksByFieldRoute

{- | POST /actions/{idAction}/reactions
     Adds a new reaction to an action
 -}
postActionsReactions :: TrelloRESTClientMonad m => Text -> Body_1 -> m ()
postActionsReactions x0 x1  = postActionsReactions' (coerce x0) (coerce x1)  where
  postActionsReactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostActionsReactionsRoute

{- | POST /boards/
     Create a new board.
 -}
postBoards :: TrelloRESTClientMonad m => Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> m ()
postBoards x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15  = postBoards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15)  where
  postBoards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsRoute

{- | POST /boards/{id}/boardPlugins
     Enable a Power-Up on a board
 -}
postBoardsBoardplugins :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postBoardsBoardplugins x0 x1  = postBoardsBoardplugins' (coerce x0) (coerce x1)  where
  postBoardsBoardplugins' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsBoardpluginsRoute

{- | POST /boards/{id}/calendarKey/generate
     Create a new board.
 -}
postBoardsCalendarkeyGenerate :: TrelloRESTClientMonad m => Text -> m ()
postBoardsCalendarkeyGenerate x0  = postBoardsCalendarkeyGenerate' (coerce x0)  where
  postBoardsCalendarkeyGenerate' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsCalendarkeyGenerateRoute

{- | POST /boards/{id}/checklists
     Create a new checklist.
 -}
postBoardsChecklists :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postBoardsChecklists x0 x1  = postBoardsChecklists' (coerce x0) (coerce x1)  where
  postBoardsChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsChecklistsRoute

{- | POST /boards/{id}/emailKey/generate
     
 -}
postBoardsEmailkeyGenerate :: TrelloRESTClientMonad m => Text -> m ()
postBoardsEmailkeyGenerate x0  = postBoardsEmailkeyGenerate' (coerce x0)  where
  postBoardsEmailkeyGenerate' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsEmailkeyGenerateRoute

{- | POST /boards/{id}/idTags
     
 -}
postBoardsIdtags :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postBoardsIdtags x0 x1  = postBoardsIdtags' (coerce x0) (coerce x1)  where
  postBoardsIdtags' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsIdtagsRoute

{- | POST /boards/{id}/labels
     
 -}
postBoardsLabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
postBoardsLabels x0 x1 x2  = postBoardsLabels' (coerce x0) (coerce x1) (coerce x2)  where
  postBoardsLabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsLabelsRoute

{- | POST /boards/{id}/lists
     
 -}
postBoardsLists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
postBoardsLists x0 x1 x2  = postBoardsLists' (coerce x0) (coerce x1) (coerce x2)  where
  postBoardsLists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsListsRoute

{- | POST /boards/{id}/markedAsViewed
     
 -}
postBoardsMarkedasviewed :: TrelloRESTClientMonad m => Text -> m ()
postBoardsMarkedasviewed x0  = postBoardsMarkedasviewed' (coerce x0)  where
  postBoardsMarkedasviewed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsMarkedasviewedRoute

{- | POST /boards/{id}/powerUps
     
 -}
postBoardsPowerups :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postBoardsPowerups x0 x1  = postBoardsPowerups' (coerce x0) (coerce x1)  where
  postBoardsPowerups' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostBoardsPowerupsRoute

{- | POST /cards
     Create a new card
 -}
postCards :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Day -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postCards x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10  = postCards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10)  where
  postCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsRoute

{- | POST /cards/{id}/actions/comments
     Add a new comment to a card
 -}
postCardsActionsComments :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postCardsActionsComments x0 x1  = postCardsActionsComments' (coerce x0) (coerce x1)  where
  postCardsActionsComments' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsActionsCommentsRoute

{- | POST /cards/{id}/attachments
     Add an attachment to a card
 -}
postCardsAttachments :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postCardsAttachments x0 x1 x2 x3  = postCardsAttachments' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postCardsAttachments' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsAttachmentsRoute

{- | POST /cards/{id}/checklists
     Create a new checklist on a card
 -}
postCardsChecklists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postCardsChecklists x0 x1 x2 x3  = postCardsChecklists' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postCardsChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsChecklistsRoute

{- | POST /cards/{id}/idLabels
     Add a label to a card
 -}
postCardsIdlabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postCardsIdlabels x0 x1  = postCardsIdlabels' (coerce x0) (coerce x1)  where
  postCardsIdlabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsIdlabelsRoute

{- | POST /cards/{id}/idMembers
     Add a member to a card
 -}
postCardsIdmembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postCardsIdmembers x0 x1  = postCardsIdmembers' (coerce x0) (coerce x1)  where
  postCardsIdmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsIdmembersRoute

{- | POST /cards/{id}/labels
     Add a new label to a card
 -}
postCardsLabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
postCardsLabels x0 x1 x2  = postCardsLabels' (coerce x0) (coerce x1) (coerce x2)  where
  postCardsLabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsLabelsRoute

{- | POST /cards/{id}/markAssociatedNotificationsRead
     Mark notifications about this card as read
 -}
postCardsMarkassociatednotificationsread :: TrelloRESTClientMonad m => Text -> m ()
postCardsMarkassociatednotificationsread x0  = postCardsMarkassociatednotificationsread' (coerce x0)  where
  postCardsMarkassociatednotificationsread' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsMarkassociatednotificationsreadRoute

{- | POST /cards/{id}/membersVoted
     Vote on the card
 -}
postCardsMembersvoted :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postCardsMembersvoted x0 x1  = postCardsMembersvoted' (coerce x0) (coerce x1)  where
  postCardsMembersvoted' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCardsMembersvotedRoute

{- | POST /checklists
     
 -}
postChecklists :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postChecklists x0 x1 x2 x3  = postChecklists' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostChecklistsRoute

{- | POST /checklists/{id}/checkItems
     
 -}
postChecklistsCheckitems :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
postChecklistsCheckitems x0 x1 x2 x3  = postChecklistsCheckitems' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postChecklistsCheckitems' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostChecklistsCheckitemsRoute

{- | POST /customFields
     Create a new Custom Field on a board.
 -}
postCustomfields :: TrelloRESTClientMonad m => Body -> m ()
postCustomfields x0  = postCustomfields' (coerce x0)  where
  postCustomfields' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCustomfieldsRoute

{- | POST /customFields/{id}/options
     Add an option to a dropdown Custom Field
 -}
postCustomfieldsOptions :: TrelloRESTClientMonad m => Text -> m ()
postCustomfieldsOptions x0  = postCustomfieldsOptions' (coerce x0)  where
  postCustomfieldsOptions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostCustomfieldsOptionsRoute

{- | POST /enterprises/{id}/tokens
     Generate an auth token for an enterprise.
 -}
postEnterprisesTokens :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postEnterprisesTokens x0 x1  = postEnterprisesTokens' (coerce x0) (coerce x1)  where
  postEnterprisesTokens' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostEnterprisesTokensRoute

{- | POST /labels
     Create a new label on a board.
 -}
postLabels :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> m ()
postLabels x0 x1 x2  = postLabels' (coerce x0) (coerce x1) (coerce x2)  where
  postLabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostLabelsRoute

{- | POST /lists
     Create a new list on a board
 -}
postLists :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postLists x0 x1 x2 x3  = postLists' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postLists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostListsRoute

{- | POST /lists/{id}/archiveAllCards
     Archive all cards in a list
 -}
postListsArchiveallcards :: TrelloRESTClientMonad m => Text -> m ()
postListsArchiveallcards x0  = postListsArchiveallcards' (coerce x0)  where
  postListsArchiveallcards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostListsArchiveallcardsRoute

{- | POST /lists/{id}/moveAllCards
     Move all cards in a list
 -}
postListsMoveallcards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
postListsMoveallcards x0 x1 x2  = postListsMoveallcards' (coerce x0) (coerce x1) (coerce x2)  where
  postListsMoveallcards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostListsMoveallcardsRoute

{- | POST /members/{id}/boardStars
     Star a new board
 -}
postMembersBoardstars :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
postMembersBoardstars x0 x1 x2  = postMembersBoardstars' (coerce x0) (coerce x1) (coerce x2)  where
  postMembersBoardstars' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostMembersBoardstarsRoute

{- | POST /members/{id}/oneTimeMessagesDismissed
     Dismiss a message
 -}
postMembersOnetimemessagesdismissed :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postMembersOnetimemessagesdismissed x0 x1  = postMembersOnetimemessagesdismissed' (coerce x0) (coerce x1)  where
  postMembersOnetimemessagesdismissed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostMembersOnetimemessagesdismissedRoute

{- | POST /members/{id}/savedSearches
     Create a new saved search
 -}
postMembersSavedsearches :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postMembersSavedsearches x0 x1 x2 x3  = postMembersSavedsearches' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postMembersSavedsearches' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostMembersSavedsearchesRoute

{- | POST /notifications/all/read
     Mark all notifications as read
 -}
postNotificationsAllRead :: TrelloRESTClientMonad m => m ()
postNotificationsAllRead  = postNotificationsAllRead'  where
  postNotificationsAllRead' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostNotificationsAllReadRoute

{- | POST /organizations
     Create a new team
 -}
postOrganizations :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postOrganizations x0 x1 x2 x3  = postOrganizations' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postOrganizations' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostOrganizationsRoute

{- | POST /organizations/{id}/exports
     Kick off CSV export for an organization
 -}
postOrganizationsExports :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
postOrganizationsExports x0 x1  = postOrganizationsExports' (coerce x0) (coerce x1)  where
  postOrganizationsExports' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostOrganizationsExportsRoute

{- | POST /organizations/{id}/logo
     Set the logo image for a team
 -}
postOrganizationsLogo :: TrelloRESTClientMonad m => Text -> m ()
postOrganizationsLogo x0  = postOrganizationsLogo' (coerce x0)  where
  postOrganizationsLogo' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostOrganizationsLogoRoute

{- | POST /organizations/{id}/tags
     Create a new collection in a team
 -}
postOrganizationsTags :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
postOrganizationsTags x0 x1  = postOrganizationsTags' (coerce x0) (coerce x1)  where
  postOrganizationsTags' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostOrganizationsTagsRoute

{- | POST /tokens/{token}/webhooks
     Create a new webhook for a token.
 -}
postTokensWebhooks :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
postTokensWebhooks x0 x1 x2 x3  = postTokensWebhooks' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postTokensWebhooks' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostTokensWebhooksRoute

{- | POST /webhooks/
     Create a new webhook.
 -}
postWebhooks :: TrelloRESTClientMonad m => Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
postWebhooks x0 x1 x2 x3  = postWebhooks' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  postWebhooks' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PostWebhooksRoute

{- | PUT /actions/{id}
     Update a comment action
 -}
putActions :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putActions x0 x1  = putActions' (coerce x0) (coerce x1)  where
  putActions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutActionsRoute

{- | PUT /actions/{id}/text
     Update a comment action
 -}
putActionsText :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putActionsText x0 x1  = putActionsText' (coerce x0) (coerce x1)  where
  putActionsText' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutActionsTextRoute

{- | PUT /boards/{id}
     Update an existing board by id
 -}
putBoards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
putBoards x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20  = putBoards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12) (coerce x13) (coerce x14) (coerce x15) (coerce x16) (coerce x17) (coerce x18) (coerce x19) (coerce x20)  where
  putBoards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsRoute

{- | PUT /boards/{id}/members
     Update an existing board by id
 -}
putBoardsMembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> Body_2 -> Maybe Text -> m ()
putBoardsMembers x0 x1 x2 x3  = putBoardsMembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  putBoardsMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMembersRoute

{- | PUT /boards/{id}/members/{idMember}
     Add a member to the board.
 -}
putBoardsMembersByMember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
putBoardsMembersByMember x0 x1 x2  = putBoardsMembersByMember' (coerce x0) (coerce x1) (coerce x2)  where
  putBoardsMembersByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMembersByMemberRoute

{- | PUT /boards/{id}/memberships/{idMembership}
     Update an existing board by id
 -}
putBoardsMembershipsByMembership :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> m ()
putBoardsMembershipsByMembership x0 x1 x2 x3  = putBoardsMembershipsByMembership' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  putBoardsMembershipsByMembership' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMembershipsByMembershipRoute

{- | PUT /boards/{id}/myPrefs/emailPosition
     Update an existing board by id
 -}
putBoardsMyprefsEmailposition :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putBoardsMyprefsEmailposition x0 x1  = putBoardsMyprefsEmailposition' (coerce x0) (coerce x1)  where
  putBoardsMyprefsEmailposition' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMyprefsEmailpositionRoute

{- | PUT /boards/{id}/myPrefs/idEmailList
     Update an existing board by id
 -}
putBoardsMyprefsIdemaillist :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putBoardsMyprefsIdemaillist x0 x1  = putBoardsMyprefsIdemaillist' (coerce x0) (coerce x1)  where
  putBoardsMyprefsIdemaillist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMyprefsIdemaillistRoute

{- | PUT /boards/{id}/myPrefs/showListGuide
     Update an existing board by id
 -}
putBoardsMyprefsShowlistguide :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putBoardsMyprefsShowlistguide x0 x1  = putBoardsMyprefsShowlistguide' (coerce x0) (coerce x1)  where
  putBoardsMyprefsShowlistguide' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMyprefsShowlistguideRoute

{- | PUT /boards/{id}/myPrefs/showSidebar
     Update an existing board by id
 -}
putBoardsMyprefsShowsidebar :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putBoardsMyprefsShowsidebar x0 x1  = putBoardsMyprefsShowsidebar' (coerce x0) (coerce x1)  where
  putBoardsMyprefsShowsidebar' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMyprefsShowsidebarRoute

{- | PUT /boards/{id}/myPrefs/showSidebarActivity
     Update an existing board by id
 -}
putBoardsMyprefsShowsidebaractivity :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putBoardsMyprefsShowsidebaractivity x0 x1  = putBoardsMyprefsShowsidebaractivity' (coerce x0) (coerce x1)  where
  putBoardsMyprefsShowsidebaractivity' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMyprefsShowsidebaractivityRoute

{- | PUT /boards/{id}/myPrefs/showSidebarBoardActions
     Update an existing board by id
 -}
putBoardsMyprefsShowsidebarboardactions :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putBoardsMyprefsShowsidebarboardactions x0 x1  = putBoardsMyprefsShowsidebarboardactions' (coerce x0) (coerce x1)  where
  putBoardsMyprefsShowsidebarboardactions' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMyprefsShowsidebarboardactionsRoute

{- | PUT /boards/{id}/myPrefs/showSidebarMembers
     Update an existing board by id
 -}
putBoardsMyprefsShowsidebarmembers :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putBoardsMyprefsShowsidebarmembers x0 x1  = putBoardsMyprefsShowsidebarmembers' (coerce x0) (coerce x1)  where
  putBoardsMyprefsShowsidebarmembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutBoardsMyprefsShowsidebarmembersRoute

{- | PUT /card/{idCard}/customField/{idCustomField}/item
     Setting, updating, and removing the value for a Custom Field on a card.
 -}
putCardCustomfieldItemByCardCustomfield :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
putCardCustomfieldItemByCardCustomfield x0 x1 x2  = putCardCustomfieldItemByCardCustomfield' (coerce x0) (coerce x1) (coerce x2)  where
  putCardCustomfieldItemByCardCustomfield' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutCardCustomfieldItemByCardCustomfieldRoute

{- | PUT /cards/{id}
     Update a card
 -}
putCards :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Day -> Maybe Bool -> Maybe Bool -> m ()
putCards x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12  = putCards' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12)  where
  putCards' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutCardsRoute

{- | PUT /cards/{id}/actions/{idAction}/comments
     Update an existing comment
 -}
putCardsActionsCommentsByAction :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
putCardsActionsCommentsByAction x0 x1 x2  = putCardsActionsCommentsByAction' (coerce x0) (coerce x1) (coerce x2)  where
  putCardsActionsCommentsByAction' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutCardsActionsCommentsByActionRoute

{- | PUT /cards/{id}/checkItem/{idCheckItem}
     Update an item in a checklist on a card.
 -}
putCardsCheckitemByCheckitem :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
putCardsCheckitemByCheckitem x0 x1 x2 x3 x4 x5  = putCardsCheckitemByCheckitem' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  putCardsCheckitemByCheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutCardsCheckitemByCheckitemRoute

{- | PUT /cards/{idCard}/checklist/{idChecklist}/checkItem/{idCheckItem}
     Update an item in a checklist on a card.
 -}
putCardsChecklistCheckitemByCardCheckitemChecklist :: TrelloRESTClientMonad m => Text -> Text -> Text -> Maybe Text -> m ()
putCardsChecklistCheckitemByCardCheckitemChecklist x0 x1 x2 x3  = putCardsChecklistCheckitemByCardCheckitemChecklist' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  putCardsChecklistCheckitemByCardCheckitemChecklist' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutCardsChecklistCheckitemByCardCheckitemChecklistRoute

{- | PUT /cards/{id}/stickers/{idSticker}
     Update a sticker on a card
 -}
putCardsStickersBySticker :: TrelloRESTClientMonad m => Text -> Text -> Maybe Float -> Maybe Float -> Maybe Int -> Maybe Float -> m ()
putCardsStickersBySticker x0 x1 x2 x3 x4 x5  = putCardsStickersBySticker' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  putCardsStickersBySticker' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutCardsStickersByStickerRoute

{- | PUT /checklists/{id}
     Update an existing checklist.
 -}
putChecklists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
putChecklists x0 x1 x2  = putChecklists' (coerce x0) (coerce x1) (coerce x2)  where
  putChecklists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutChecklistsRoute

{- | PUT /checklists/{id}/checkItems/{idCheckItem}
     Update check item.
 -}
putChecklistsCheckitemsByCheckitem :: TrelloRESTClientMonad m => Text -> Text -> Maybe Int -> m ()
putChecklistsCheckitemsByCheckitem x0 x1 x2  = putChecklistsCheckitemsByCheckitem' (coerce x0) (coerce x1) (coerce x2)  where
  putChecklistsCheckitemsByCheckitem' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutChecklistsCheckitemsByCheckitemRoute

{- | PUT /checklists/{id}/name
     
 -}
putChecklistsName :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putChecklistsName x0 x1  = putChecklistsName' (coerce x0) (coerce x1)  where
  putChecklistsName' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutChecklistsNameRoute

{- | PUT /customfields/{id}
     Update a Custom Field definition.
 -}
putCustomfields :: TrelloRESTClientMonad m => Text -> Body_3 -> m ()
putCustomfields x0 x1  = putCustomfields' (coerce x0) (coerce x1)  where
  putCustomfields' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutCustomfieldsRoute

{- | PUT /enterprises/{id}/admins/{idMember}
     Make member an admin of enterprise.
 -}
putEnterprisesAdminsByMember :: TrelloRESTClientMonad m => Text -> Text -> m ()
putEnterprisesAdminsByMember x0 x1  = putEnterprisesAdminsByMember' (coerce x0) (coerce x1)  where
  putEnterprisesAdminsByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutEnterprisesAdminsByMemberRoute

{- | PUT /enterprises/{id}/members/{idMember}/deactivated
     Deactivate a member of an enterprise.
 -}
putEnterprisesMembersDeactivatedByMember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
putEnterprisesMembersDeactivatedByMember x0 x1 x2 x3 x4 x5  = putEnterprisesMembersDeactivatedByMember' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  putEnterprisesMembersDeactivatedByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutEnterprisesMembersDeactivatedByMemberRoute

{- | PUT /enterprises/{id}/organizations
     Transfer an organization to an enterprise.
 -}
putEnterprisesOrganizations :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putEnterprisesOrganizations x0 x1  = putEnterprisesOrganizations' (coerce x0) (coerce x1)  where
  putEnterprisesOrganizations' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutEnterprisesOrganizationsRoute

{- | PUT /labels/{id}
     Update a label by ID.
 -}
putLabels :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> m ()
putLabels x0 x1 x2  = putLabels' (coerce x0) (coerce x1) (coerce x2)  where
  putLabels' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutLabelsRoute

{- | PUT /labels/{id}/color
     Update the color of a label by ID.
 -}
putLabelsColor :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putLabelsColor x0 x1  = putLabelsColor' (coerce x0) (coerce x1)  where
  putLabelsColor' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutLabelsColorRoute

{- | PUT /labels/{id}/name
     Update the name of a label by ID.
 -}
putLabelsName :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putLabelsName x0 x1  = putLabelsName' (coerce x0) (coerce x1)  where
  putLabelsName' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutLabelsNameRoute

{- | PUT /lists/{id}
     Update the properties of a list
 -}
putLists :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
putLists x0 x1 x2 x3 x4 x5  = putLists' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5)  where
  putLists' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutListsRoute

{- | PUT /lists/{id}/closed
     Archive or unarchive a list
 -}
putListsClosed :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putListsClosed x0 x1  = putListsClosed' (coerce x0) (coerce x1)  where
  putListsClosed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutListsClosedRoute

{- | PUT /lists/{id}/idBoard
     Move a list to a new board
 -}
putListsIdboard :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putListsIdboard x0 x1  = putListsIdboard' (coerce x0) (coerce x1)  where
  putListsIdboard' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutListsIdboardRoute

{- | PUT /lists/{id}/name
     Rename a list
 -}
putListsName :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putListsName x0 x1  = putListsName' (coerce x0) (coerce x1)  where
  putListsName' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutListsNameRoute

{- | PUT /lists/{id}/pos
     Change the position of a list
 -}
putListsPos :: TrelloRESTClientMonad m => Text -> Maybe Text -> m ()
putListsPos x0 x1  = putListsPos' (coerce x0) (coerce x1)  where
  putListsPos' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutListsPosRoute

{- | PUT /lists/{id}/subscribed
     Subscribe or unsubscribe from a list
 -}
putListsSubscribed :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putListsSubscribed x0 x1  = putListsSubscribed' (coerce x0) (coerce x1)  where
  putListsSubscribed' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutListsSubscribedRoute

{- | PUT /members/{id}
     Update a member
 -}
putMembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Text -> Maybe Int -> m ()
putMembers x0 x1 x2 x3 x4 x5 x6 x7 x8  = putMembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8)  where
  putMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutMembersRoute

{- | PUT /members/{id}/boardBackgrounds/{idBackground}
     Update a board background
 -}
putMembersBoardbackgroundsByBackground :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Bool -> m ()
putMembersBoardbackgroundsByBackground x0 x1 x2 x3  = putMembersBoardbackgroundsByBackground' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  putMembersBoardbackgroundsByBackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutMembersBoardbackgroundsByBackgroundRoute

{- | PUT /members/{id}/boardStars/{idStar}
     Update the position of a starred board
 -}
putMembersBoardstarsByStar :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
putMembersBoardstarsByStar x0 x1 x2  = putMembersBoardstarsByStar' (coerce x0) (coerce x1) (coerce x2)  where
  putMembersBoardstarsByStar' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutMembersBoardstarsByStarRoute

{- | PUT /members/{id}//customBoardBackgrounds/{idBackground}
     
 -}
putMembersCustomboardbackgroundsByBackground :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Bool -> m ()
putMembersCustomboardbackgroundsByBackground x0 x1 x2 x3  = putMembersCustomboardbackgroundsByBackground' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  putMembersCustomboardbackgroundsByBackground' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutMembersCustomboardbackgroundsByBackgroundRoute

{- | PUT /members/{id}/savedSearches/{idSearch}
     Update a saved search
 -}
putMembersSavedsearchesBySearch :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
putMembersSavedsearchesBySearch x0 x1 x2 x3 x4  = putMembersSavedsearchesBySearch' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  putMembersSavedsearchesBySearch' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutMembersSavedsearchesBySearchRoute

{- | PUT /notifications/{id}
     Update the read status of a notification
 -}
putNotifications :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putNotifications x0 x1  = putNotifications' (coerce x0) (coerce x1)  where
  putNotifications' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutNotificationsRoute

{- | PUT /notifications/{id}/unread
     Update the read status of a notification
 -}
putNotificationsUnread :: TrelloRESTClientMonad m => Text -> Maybe Bool -> m ()
putNotificationsUnread x0 x1  = putNotificationsUnread' (coerce x0) (coerce x1)  where
  putNotificationsUnread' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutNotificationsUnreadRoute

{- | PUT /organizations/{id}
     Update an organization
 -}
putOrganizations :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> Maybe Int -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
putOrganizations x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12  = putOrganizations' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4) (coerce x5) (coerce x6) (coerce x7) (coerce x8) (coerce x9) (coerce x10) (coerce x11) (coerce x12)  where
  putOrganizations' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutOrganizationsRoute

{- | PUT /organizations/{id}/members
     
 -}
putOrganizationsMembers :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
putOrganizationsMembers x0 x1 x2 x3  = putOrganizationsMembers' (coerce x0) (coerce x1) (coerce x2) (coerce x3)  where
  putOrganizationsMembers' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutOrganizationsMembersRoute

{- | PUT /organizations/{id}/members/{idMember}
     Add a member to a team or update their member type.
 -}
putOrganizationsMembersByMember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> m ()
putOrganizationsMembersByMember x0 x1 x2  = putOrganizationsMembersByMember' (coerce x0) (coerce x1) (coerce x2)  where
  putOrganizationsMembersByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutOrganizationsMembersByMemberRoute

{- | PUT /organizations/{id}/members/{idMember}/deactivated
     Deactivate or reactivate a member of a team
 -}
putOrganizationsMembersDeactivatedByMember :: TrelloRESTClientMonad m => Text -> Text -> Maybe Bool -> m ()
putOrganizationsMembersDeactivatedByMember x0 x1 x2  = putOrganizationsMembersDeactivatedByMember' (coerce x0) (coerce x1) (coerce x2)  where
  putOrganizationsMembersDeactivatedByMember' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutOrganizationsMembersDeactivatedByMemberRoute

{- | PUT /tokens/{token}/webhooks/{webhookId}
     Update an existing webhook.
 -}
putTokensWebhooksByTokenWebhookid :: TrelloRESTClientMonad m => Text -> Text -> Maybe Text -> Maybe Text -> Maybe Text -> m ()
putTokensWebhooksByTokenWebhookid x0 x1 x2 x3 x4  = putTokensWebhooksByTokenWebhookid' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  putTokensWebhooksByTokenWebhookid' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutTokensWebhooksByTokenWebhookidRoute

{- | PUT /webhooks/{id}
     Update a webhook by ID.
 -}
putWebhooks :: TrelloRESTClientMonad m => Text -> Maybe Text -> Maybe Text -> Maybe Text -> Maybe Bool -> m ()
putWebhooks x0 x1 x2 x3 x4  = putWebhooks' (coerce x0) (coerce x1) (coerce x2) (coerce x3) (coerce x4)  where
  putWebhooks' = hoistClient proxy liftTrelloRESTClient (client proxy)
  proxy = Proxy :: Proxy PutWebhooksRoute



