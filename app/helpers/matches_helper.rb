module MatchesHelper
    include CableReady::Broadcaster

    def update_match(user_id, othermatch)
        cable_ready["accepted"].set_value(
            selector: "#"+ ActionView::RecordIdentifier.dom_id(othermatch),
            name: "accepted",
            value: true
            # html: ApplicationController.render(othermatch),
            # detail: {
            #     id: match_id,
            #     to_user: User.find_by(id:user_id),
            #     #other_match: Match.find_by(id: match_id),
            #     notif_type: "match"
            # }
        )
        cable_ready.broadcast
        cable_ready["accepted"].set_style(
            selector: "#"+ ActionView::RecordIdentifier.dom_id(othermatch),
            name: "background",
            value: "red"
            # html: ApplicationController.render(othermatch),
            # detail: {
            #     id: match_id,
            #     to_user: User.find_by(id:user_id),
            #     #other_match: Match.find_by(id: match_id),
            #     notif_type: "match"
            # }
        )
        cable_ready.broadcast
        cable_ready["accepted"].set_property(
            selector: "#"+ ActionView::RecordIdentifier.dom_id(othermatch),
            name: "accepted",
            value: true
            # html: ApplicationController.render(othermatch),
            # detail: {
            #     id: match_id,
            #     to_user: User.find_by(id:user_id),
            #     #other_match: Match.find_by(id: match_id),
            #     notif_type: "match"
            # }
        )
        cable_ready.broadcast
        # cable_ready["accepted"].morph(
        #     selector: "#" + ActionView::RecordIdentifier.dom_id(othermatch),
        #     html: ApplicationController.render(othermatch)
        #   )
        #   cable_ready.broadcast
    end
end
