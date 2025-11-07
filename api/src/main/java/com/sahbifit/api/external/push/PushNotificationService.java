// This file was empty, now add content:
package com.sahbifit.api.external.push;

import com.sahbifit.api.user.model.User;
import com.sahbifit.api.verification.model.VerificationStatus;

public interface PushNotificationService {

    /**
     * Sends a notification when a user's verification is approved.
     */
    void sendVerificationApproved(User user);

    /**
     * Sends a notification when a user's verification is rejected.
     */
    void sendVerificationRejected(User user, VerificationStatus reason);
}