/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

import React, { Component } from 'react';

import { PeerTypes } from 'constants/ActorAppConstants';

import requireAuth from 'utils/require-auth';
import ActorClient from 'utils/ActorClient';
import PeerUtils from 'utils/PeerUtils';
import RouterContainer from 'utils/RouterContainer';

import DialogActionCreators from 'actions/DialogActionCreators';
import VisibilityActionCreators from 'actions/VisibilityActionCreators';

import SidebarSection from 'components/SidebarSection.react';
import DialogSection from 'components/DialogSection.react';
import Banner from 'components/common/Banner.react';
import Favicon from 'components/common/Favicon.react';

class Main extends Component {
  static contextTypes = {
    router: React.PropTypes.func
  };

  static propTypes = {
    params: React.PropTypes.object
  };

  constructor(props) {
    super(props);

    const { params } = props;
    const peer = PeerUtils.stringToPeer(params.id);

    document.addEventListener('visibilitychange', this.onVisibilityChange);

    if (!document.hidden) {
      VisibilityActionCreators.createAppVisible();
    }

    if (peer) {
      // It is needed to prevent failure on opening dialog while library didn't load dialogs (right after auth)
      let peerInfo = undefined;

      if (peer.type == PeerTypes.GROUP) {
        peerInfo = ActorClient.getGroup(peer.id)
      } else {
        peerInfo = ActorClient.getUser(peer.id)
      }

      if (peerInfo) {
        DialogActionCreators.selectDialogPeer(peer);
      } else {
        RouterContainer.get().transitionTo('/');
      }
    }
  }

  onVisibilityChange = () => {
    if (!document.hidden) {
      VisibilityActionCreators.createAppVisible();
    } else {
      VisibilityActionCreators.createAppHidden();
    }
  };

  render() {
    const { params } = this.props;
    const peer = PeerUtils.stringToPeer(params.id);

    return (
      <div className="app">
        <Favicon/>
        <Banner/>
        <SidebarSection selectedPeer={peer}/>
        <DialogSection peer={peer}/>
      </div>
    );
  }
}

export default requireAuth(Main);
