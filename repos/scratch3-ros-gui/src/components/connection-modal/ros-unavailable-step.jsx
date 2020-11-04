import {FormattedMessage} from 'react-intl';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import React from 'react';

import Box from '../box/box.jsx';
import helpIcon from './icons/help.svg';
import backIcon from './icons/back.svg';
import rosErrorIcon from './icons/ros-error.svg';

import styles from './connection-modal.css';

const RosUnavailableStep = props => (
    <Box className={styles.body}>
        <Box className={styles.activityArea}>
          <div className={styles.scratchLinkHelp}>
              <div className={styles.scratchLinkHelpStep}>
                <div className={styles.helpStepImage}>
                  <img className={styles.rosIcon}
                     src={rosErrorIcon}
                     />
                </div>
                <div className={styles.rosErrorMessage}>
                  Error connecting to ROS!!
                </div>
              </div>
              <div className={styles.rosHelpText}>
                Make sure to enable connections with:
              </div>
            <div className={styles.terminalCommand}>
              roslaunch rosbridge_server rosbridge_websocket.launch
            </div>
          </div>
        </Box>
        <Box className={styles.bottomArea}>
            <Box className={classNames(styles.bottomAreaItem, styles.buttonRow)}>
                <button
                    className={styles.connectionButton}
                    onClick={props.onScanning}
                >
                    <img
                        className={classNames(styles.buttonIconLeft, styles.buttonIconBack)}
                        src={backIcon}
                    />
                    <FormattedMessage
                        defaultMessage="Try again"
                        description="Button to initiate trying the device connection again after an error"
                        id="gui.connection.unavailable.tryagainbutton"
                    />
                </button>
                <button
                    className={styles.connectionButton}
                    onClick={props.onHelp}
                >
                    <img
                        className={styles.buttonIconLeft}
                        src={helpIcon}
                    />
                    <FormattedMessage
                        defaultMessage="Help"
                        description="Button to view help content"
                        id="gui.connection.unavailable.helpbutton"
                    />
                </button>
            </Box>
        </Box>
    </Box>
);

RosUnavailableStep.propTypes = {
    onHelp: PropTypes.func,
    onScanning: PropTypes.func
};

export default RosUnavailableStep;
