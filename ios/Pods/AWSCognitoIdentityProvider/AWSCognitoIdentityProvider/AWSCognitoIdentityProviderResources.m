//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSCognitoIdentityProviderResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSCognitoIdentityProviderResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSCognitoIdentityProviderResources

+ (instancetype)sharedInstance {
    static AWSCognitoIdentityProviderResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSCognitoIdentityProviderResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2016-04-18\",\
    \"endpointPrefix\":\"cognito-idp\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Cognito Identity Provider\",\
    \"serviceId\":\"Cognito Identity Provider\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"AWSCognitoIdentityProviderService\",\
    \"uid\":\"cognito-idp-2016-04-18\"\
  },\
  \"operations\":{\
    \"AddCustomAttributes\":{\
      \"name\":\"AddCustomAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AddCustomAttributesRequest\"},\
      \"output\":{\"shape\":\"AddCustomAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserImportInProgressException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Adds additional user attributes to the user pool schema.</p>\"\
    },\
    \"AdminAddUserToGroup\":{\
      \"name\":\"AdminAddUserToGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminAddUserToGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified user to the specified group.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminConfirmSignUp\":{\
      \"name\":\"AdminConfirmSignUp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminConfirmSignUpRequest\"},\
      \"output\":{\"shape\":\"AdminConfirmSignUpResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyFailedAttemptsException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Confirms user registration as an admin without using a confirmation code. Works on any user.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminCreateUser\":{\
      \"name\":\"AdminCreateUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminCreateUserRequest\"},\
      \"output\":{\"shape\":\"AdminCreateUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UsernameExistsException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnsupportedUserStateException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a new user in the specified user pool.</p> <p>If <code>MessageAction</code> is not set, the default is to send a welcome message via email or phone (SMS).</p> <p>This message is based on a template that you configured in your call to create or update a user pool. This template includes your custom sign-up instructions and placeholders for user name and temporary password.</p> <p>Alternatively, you can call <code>AdminCreateUser</code> with âSUPPRESSâ for the <code>MessageAction</code> parameter, and Amazon Cognito will not send any email. </p> <p>In either case, the user will be in the <code>FORCE_CHANGE_PASSWORD</code> state until they sign in and change their password.</p> <p> <code>AdminCreateUser</code> requires developer credentials.</p>\"\
    },\
    \"AdminDeleteUser\":{\
      \"name\":\"AdminDeleteUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminDeleteUserRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a user as an administrator. Works on any user.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminDeleteUserAttributes\":{\
      \"name\":\"AdminDeleteUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminDeleteUserAttributesRequest\"},\
      \"output\":{\"shape\":\"AdminDeleteUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the user attributes in a user pool as an administrator. Works on any user.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminDisableProviderForUser\":{\
      \"name\":\"AdminDisableProviderForUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminDisableProviderForUserRequest\"},\
      \"output\":{\"shape\":\"AdminDisableProviderForUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Disables the user from signing in with the specified external (SAML or social) identity provider. If the user to disable is a Cognito User Pools native username + password user, they are not permitted to use their password to sign-in. If the user to disable is a linked external IdP user, any link between that user and an existing user is removed. The next time the external user (no longer attached to the previously linked <code>DestinationUser</code>) signs in, they must create a new user account. See <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html\\\">AdminLinkProviderForUser</a>.</p> <p>This action is enabled only for admin access and requires developer credentials.</p> <p>The <code>ProviderName</code> must match the value specified when creating an IdP for the pool. </p> <p>To disable a native username + password user, the <code>ProviderName</code> value must be <code>Cognito</code> and the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code>, with the <code>ProviderAttributeValue</code> being the name that is used in the user pool for the user.</p> <p>The <code>ProviderAttributeName</code> must always be <code>Cognito_Subject</code> for social identity providers. The <code>ProviderAttributeValue</code> must always be the exact subject that was used when the user was originally linked as a source user.</p> <p>For de-linking a SAML identity, there are two scenarios. If the linked identity has not yet been used to sign-in, the <code>ProviderAttributeName</code> and <code>ProviderAttributeValue</code> must be the same values that were used for the <code>SourceUser</code> when the identities were originally linked using <code> AdminLinkProviderForUser</code> call. (If the linking was done with <code>ProviderAttributeName</code> set to <code>Cognito_Subject</code>, the same applies here). However, if the user has already signed in, the <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code> and <code>ProviderAttributeValue</code> must be the subject of the SAML assertion.</p>\"\
    },\
    \"AdminDisableUser\":{\
      \"name\":\"AdminDisableUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminDisableUserRequest\"},\
      \"output\":{\"shape\":\"AdminDisableUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Disables the specified user.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminEnableUser\":{\
      \"name\":\"AdminEnableUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminEnableUserRequest\"},\
      \"output\":{\"shape\":\"AdminEnableUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Enables the specified user as an administrator. Works on any user.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminForgetDevice\":{\
      \"name\":\"AdminForgetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminForgetDeviceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Forgets the device, as an administrator.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminGetDevice\":{\
      \"name\":\"AdminGetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminGetDeviceRequest\"},\
      \"output\":{\"shape\":\"AdminGetDeviceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Gets the device, as an administrator.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminGetUser\":{\
      \"name\":\"AdminGetUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminGetUserRequest\"},\
      \"output\":{\"shape\":\"AdminGetUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the specified user by user name in a user pool as an administrator. Works on any user.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminInitiateAuth\":{\
      \"name\":\"AdminInitiateAuth\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminInitiateAuthRequest\"},\
      \"output\":{\"shape\":\"AdminInitiateAuthResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"MFAMethodNotFoundException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"}\
      ],\
      \"documentation\":\"<p>Initiates the authentication flow, as an administrator.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminLinkProviderForUser\":{\
      \"name\":\"AdminLinkProviderForUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminLinkProviderForUserRequest\"},\
      \"output\":{\"shape\":\"AdminLinkProviderForUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Links an existing user account in a user pool (<code>DestinationUser</code>) to an identity from an external identity provider (<code>SourceUser</code>) based on a specified attribute name and value from the external identity provider. This allows you to create a link from the existing user account to an external federated user identity that has not yet been used to sign in, so that the federated user identity can be used to sign in as the existing user account. </p> <p> For example, if there is an existing user with a username and password, this API links that user to a federated user identity, so that when the federated user identity is used, the user signs in as the existing user account. </p> <note> <p>The maximum number of federated identities linked to a user is 5.</p> </note> <important> <p>Because this API allows a user with an external federated identity to sign in as an existing user in the user pool, it is critical that it only be used with external identity providers and provider attributes that have been trusted by the application owner.</p> </important> <p>This action is enabled only for admin access and requires developer credentials.</p>\"\
    },\
    \"AdminListDevices\":{\
      \"name\":\"AdminListDevices\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminListDevicesRequest\"},\
      \"output\":{\"shape\":\"AdminListDevicesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Lists devices, as an administrator.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminListGroupsForUser\":{\
      \"name\":\"AdminListGroupsForUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminListGroupsForUserRequest\"},\
      \"output\":{\"shape\":\"AdminListGroupsForUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the groups that the user belongs to.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminListUserAuthEvents\":{\
      \"name\":\"AdminListUserAuthEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminListUserAuthEventsRequest\"},\
      \"output\":{\"shape\":\"AdminListUserAuthEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserPoolAddOnNotEnabledException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists a history of user activity and any risks detected as part of Amazon Cognito advanced security.</p>\"\
    },\
    \"AdminRemoveUserFromGroup\":{\
      \"name\":\"AdminRemoveUserFromGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminRemoveUserFromGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified user from the specified group.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminResetUserPassword\":{\
      \"name\":\"AdminResetUserPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminResetUserPasswordRequest\"},\
      \"output\":{\"shape\":\"AdminResetUserPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Resets the specified user's password in a user pool as an administrator. Works on any user.</p> <p>When a developer calls this API, the current password is invalidated, so it must be changed. If a user tries to sign in after the API is called, the app will get a PasswordResetRequiredException exception back and should direct the user down the flow to reset the password, which is the same as the forgot password flow. In addition, if the user pool has phone verification selected and a verified phone number exists for the user, or if email verification is selected and a verified email exists for the user, calling this API will also result in sending a message to the end user with the code to change their password.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminRespondToAuthChallenge\":{\
      \"name\":\"AdminRespondToAuthChallenge\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminRespondToAuthChallengeRequest\"},\
      \"output\":{\"shape\":\"AdminRespondToAuthChallengeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"MFAMethodNotFoundException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"SoftwareTokenMFANotFoundException\"}\
      ],\
      \"documentation\":\"<p>Responds to an authentication challenge, as an administrator.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminSetUserMFAPreference\":{\
      \"name\":\"AdminSetUserMFAPreference\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminSetUserMFAPreferenceRequest\"},\
      \"output\":{\"shape\":\"AdminSetUserMFAPreferenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Sets the user's multi-factor authentication (MFA) preference, including which MFA options are enabled and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are enabled. If multiple options are enabled and no preference is set, a challenge to choose an MFA option will be returned during sign in.</p>\"\
    },\
    \"AdminSetUserPassword\":{\
      \"name\":\"AdminSetUserPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminSetUserPasswordRequest\"},\
      \"output\":{\"shape\":\"AdminSetUserPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPasswordException\"}\
      ],\
      \"documentation\":\"<p>Sets the specified user's password in a user pool as an administrator. Works on any user. </p> <p>The password can be temporary or permanent. If it is temporary, the user status will be placed into the <code>FORCE_CHANGE_PASSWORD</code> state. When the user next tries to sign in, the InitiateAuth/AdminInitiateAuth response will contain the <code>NEW_PASSWORD_REQUIRED</code> challenge. If the user does not sign in before it expires, the user will not be able to sign in and their password will need to be reset by an administrator. </p> <p>Once the user has set a new password, or the password is permanent, the user status will be set to <code>Confirmed</code>.</p>\"\
    },\
    \"AdminSetUserSettings\":{\
      \"name\":\"AdminSetUserSettings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminSetUserSettingsRequest\"},\
      \"output\":{\"shape\":\"AdminSetUserSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p> <i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure TOTP software token MFA. To configure either type of MFA, use <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserMFAPreference.html\\\">AdminSetUserMFAPreference</a> instead.</p>\"\
    },\
    \"AdminUpdateAuthEventFeedback\":{\
      \"name\":\"AdminUpdateAuthEventFeedback\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminUpdateAuthEventFeedbackRequest\"},\
      \"output\":{\"shape\":\"AdminUpdateAuthEventFeedbackResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserPoolAddOnNotEnabledException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Provides feedback for an authentication event as to whether it was from a valid user. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p>\"\
    },\
    \"AdminUpdateDeviceStatus\":{\
      \"name\":\"AdminUpdateDeviceStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminUpdateDeviceStatusRequest\"},\
      \"output\":{\"shape\":\"AdminUpdateDeviceStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the device status as an administrator.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminUpdateUserAttributes\":{\
      \"name\":\"AdminUpdateUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminUpdateUserAttributesRequest\"},\
      \"output\":{\"shape\":\"AdminUpdateUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified user's attributes, including developer attributes, as an administrator. Works on any user.</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p> <p>In addition to updating user attributes, this API can also be used to mark phone and email as verified.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AdminUserGlobalSignOut\":{\
      \"name\":\"AdminUserGlobalSignOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AdminUserGlobalSignOutRequest\"},\
      \"output\":{\"shape\":\"AdminUserGlobalSignOutResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Signs out users from all devices, as an administrator. It also invalidates all refresh tokens issued to a user. The user's current access and Id tokens remain valid until their expiry. Access and Id tokens expire one hour after they are issued.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"AssociateSoftwareToken\":{\
      \"name\":\"AssociateSoftwareToken\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateSoftwareTokenRequest\"},\
      \"output\":{\"shape\":\"AssociateSoftwareTokenResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"SoftwareTokenMFANotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns a unique generated shared secret key code for the user account. The request takes an access token or a session string, but not both.</p>\"\
    },\
    \"ChangePassword\":{\
      \"name\":\"ChangePassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ChangePasswordRequest\"},\
      \"output\":{\"shape\":\"ChangePasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Changes the password for a specified user in a user pool.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"ConfirmDevice\":{\
      \"name\":\"ConfirmDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmDeviceRequest\"},\
      \"output\":{\"shape\":\"ConfirmDeviceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"UsernameExistsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Confirms tracking of the device. This API call is the call that begins device tracking.</p>\"\
    },\
    \"ConfirmForgotPassword\":{\
      \"name\":\"ConfirmForgotPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmForgotPasswordRequest\"},\
      \"output\":{\"shape\":\"ConfirmForgotPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"TooManyFailedAttemptsException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows a user to enter a confirmation code to reset a forgotten password.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"ConfirmSignUp\":{\
      \"name\":\"ConfirmSignUp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ConfirmSignUpRequest\"},\
      \"output\":{\"shape\":\"ConfirmSignUpResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyFailedAttemptsException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Confirms registration of a user and handles the existing alias from a previous user.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"CreateGroup\":{\
      \"name\":\"CreateGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateGroupRequest\"},\
      \"output\":{\"shape\":\"CreateGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"GroupExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a new group in the specified user pool.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"CreateIdentityProvider\":{\
      \"name\":\"CreateIdentityProvider\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateIdentityProviderRequest\"},\
      \"output\":{\"shape\":\"CreateIdentityProviderResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateProviderException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates an identity provider for a user pool.</p>\"\
    },\
    \"CreateResourceServer\":{\
      \"name\":\"CreateResourceServer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateResourceServerRequest\"},\
      \"output\":{\"shape\":\"CreateResourceServerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a new OAuth2.0 resource server and defines custom scopes in it.</p>\"\
    },\
    \"CreateUserImportJob\":{\
      \"name\":\"CreateUserImportJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateUserImportJobRequest\"},\
      \"output\":{\"shape\":\"CreateUserImportJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates the user import job.</p>\"\
    },\
    \"CreateUserPool\":{\
      \"name\":\"CreateUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateUserPoolRequest\"},\
      \"output\":{\"shape\":\"CreateUserPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserPoolTaggingException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Amazon Cognito user pool and sets the password policy for the pool.</p>\"\
    },\
    \"CreateUserPoolClient\":{\
      \"name\":\"CreateUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateUserPoolClientRequest\"},\
      \"output\":{\"shape\":\"CreateUserPoolClientResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ScopeDoesNotExistException\"},\
        {\"shape\":\"InvalidOAuthFlowException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates the user pool client.</p>\"\
    },\
    \"CreateUserPoolDomain\":{\
      \"name\":\"CreateUserPoolDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateUserPoolDomainRequest\"},\
      \"output\":{\"shape\":\"CreateUserPoolDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Creates a new domain for a user pool.</p>\"\
    },\
    \"DeleteGroup\":{\
      \"name\":\"DeleteGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a group. Currently only groups with no members can be deleted.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"DeleteIdentityProvider\":{\
      \"name\":\"DeleteIdentityProvider\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteIdentityProviderRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnsupportedIdentityProviderException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes an identity provider for a user pool.</p>\"\
    },\
    \"DeleteResourceServer\":{\
      \"name\":\"DeleteResourceServer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteResourceServerRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a resource server.</p>\"\
    },\
    \"DeleteUser\":{\
      \"name\":\"DeleteUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows a user to delete himself or herself.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"DeleteUserAttributes\":{\
      \"name\":\"DeleteUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserAttributesRequest\"},\
      \"output\":{\"shape\":\"DeleteUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the attributes for a user.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"DeleteUserPool\":{\
      \"name\":\"DeleteUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserPoolRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserImportInProgressException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified Amazon Cognito user pool.</p>\"\
    },\
    \"DeleteUserPoolClient\":{\
      \"name\":\"DeleteUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserPoolClientRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows the developer to delete the user pool client.</p>\"\
    },\
    \"DeleteUserPoolDomain\":{\
      \"name\":\"DeleteUserPoolDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteUserPoolDomainRequest\"},\
      \"output\":{\"shape\":\"DeleteUserPoolDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Deletes a domain for a user pool.</p>\"\
    },\
    \"DescribeIdentityProvider\":{\
      \"name\":\"DescribeIdentityProvider\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeIdentityProviderRequest\"},\
      \"output\":{\"shape\":\"DescribeIdentityProviderResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a specific identity provider.</p>\"\
    },\
    \"DescribeResourceServer\":{\
      \"name\":\"DescribeResourceServer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeResourceServerRequest\"},\
      \"output\":{\"shape\":\"DescribeResourceServerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Describes a resource server.</p>\"\
    },\
    \"DescribeRiskConfiguration\":{\
      \"name\":\"DescribeRiskConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeRiskConfigurationRequest\"},\
      \"output\":{\"shape\":\"DescribeRiskConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserPoolAddOnNotEnabledException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Describes the risk configuration.</p>\"\
    },\
    \"DescribeUserImportJob\":{\
      \"name\":\"DescribeUserImportJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUserImportJobRequest\"},\
      \"output\":{\"shape\":\"DescribeUserImportJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Describes the user import job.</p>\"\
    },\
    \"DescribeUserPool\":{\
      \"name\":\"DescribeUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUserPoolRequest\"},\
      \"output\":{\"shape\":\"DescribeUserPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserPoolTaggingException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Returns the configuration information and metadata of the specified user pool.</p>\"\
    },\
    \"DescribeUserPoolClient\":{\
      \"name\":\"DescribeUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUserPoolClientRequest\"},\
      \"output\":{\"shape\":\"DescribeUserPoolClientResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Client method for returning the configuration information and metadata of the specified user pool app client.</p>\"\
    },\
    \"DescribeUserPoolDomain\":{\
      \"name\":\"DescribeUserPoolDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeUserPoolDomainRequest\"},\
      \"output\":{\"shape\":\"DescribeUserPoolDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a domain.</p>\"\
    },\
    \"ForgetDevice\":{\
      \"name\":\"ForgetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ForgetDeviceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Forgets the specified device.</p>\"\
    },\
    \"ForgotPassword\":{\
      \"name\":\"ForgotPassword\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ForgotPasswordRequest\"},\
      \"output\":{\"shape\":\"ForgotPasswordResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Calling this API causes a message to be sent to the end user with a confirmation code that is required to change the user's password. For the <code>Username</code> parameter, you can use the username or user alias. The method used to send the confirmation code is sent according to the specified AccountRecoverySetting. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-recover-a-user-account.html\\\">Recovering User Accounts</a> in the <i>Amazon Cognito Developer Guide</i>. If neither a verified phone number nor a verified email exists, an <code>InvalidParameterException</code> is thrown. To use the confirmation code for resetting the password, call <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmForgotPassword.html\\\">ConfirmForgotPassword</a>.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"GetCSVHeader\":{\
      \"name\":\"GetCSVHeader\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCSVHeaderRequest\"},\
      \"output\":{\"shape\":\"GetCSVHeaderResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the header information for the .csv file to be used as input for the user import job.</p>\"\
    },\
    \"GetDevice\":{\
      \"name\":\"GetDevice\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDeviceRequest\"},\
      \"output\":{\"shape\":\"GetDeviceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the device.</p>\"\
    },\
    \"GetGroup\":{\
      \"name\":\"GetGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetGroupRequest\"},\
      \"output\":{\"shape\":\"GetGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets a group.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"GetIdentityProviderByIdentifier\":{\
      \"name\":\"GetIdentityProviderByIdentifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetIdentityProviderByIdentifierRequest\"},\
      \"output\":{\"shape\":\"GetIdentityProviderByIdentifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the specified identity provider.</p>\"\
    },\
    \"GetSigningCertificate\":{\
      \"name\":\"GetSigningCertificate\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSigningCertificateRequest\"},\
      \"output\":{\"shape\":\"GetSigningCertificateResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>This method takes a user pool ID, and returns the signing certificate.</p>\"\
    },\
    \"GetUICustomization\":{\
      \"name\":\"GetUICustomization\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetUICustomizationRequest\"},\
      \"output\":{\"shape\":\"GetUICustomizationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the UI Customization information for a particular app client's app UI, if there is something set. If nothing is set for the particular client, but there is an existing pool level customization (app <code>clientId</code> will be <code>ALL</code>), then that is returned. If nothing is present, then an empty shape is returned.</p>\"\
    },\
    \"GetUser\":{\
      \"name\":\"GetUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetUserRequest\"},\
      \"output\":{\"shape\":\"GetUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the user attributes and metadata for a user.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"GetUserAttributeVerificationCode\":{\
      \"name\":\"GetUserAttributeVerificationCode\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetUserAttributeVerificationCodeRequest\"},\
      \"output\":{\"shape\":\"GetUserAttributeVerificationCodeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the user attribute verification code for the specified attribute name.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"GetUserPoolMfaConfig\":{\
      \"name\":\"GetUserPoolMfaConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetUserPoolMfaConfigRequest\"},\
      \"output\":{\"shape\":\"GetUserPoolMfaConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Gets the user pool multi-factor authentication (MFA) configuration.</p>\"\
    },\
    \"GlobalSignOut\":{\
      \"name\":\"GlobalSignOut\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GlobalSignOutRequest\"},\
      \"output\":{\"shape\":\"GlobalSignOutResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Signs out users from all devices. It also invalidates all refresh tokens issued to a user. The user's current access and Id tokens remain valid until their expiry. Access and Id tokens expire one hour after they are issued.</p>\"\
    },\
    \"InitiateAuth\":{\
      \"name\":\"InitiateAuth\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"InitiateAuthRequest\"},\
      \"output\":{\"shape\":\"InitiateAuthResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"}\
      ],\
      \"documentation\":\"<p>Initiates the authentication flow.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"ListDevices\":{\
      \"name\":\"ListDevices\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDevicesRequest\"},\
      \"output\":{\"shape\":\"ListDevicesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the devices.</p>\"\
    },\
    \"ListGroups\":{\
      \"name\":\"ListGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListGroupsRequest\"},\
      \"output\":{\"shape\":\"ListGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the groups associated with a user pool.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"ListIdentityProviders\":{\
      \"name\":\"ListIdentityProviders\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListIdentityProvidersRequest\"},\
      \"output\":{\"shape\":\"ListIdentityProvidersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists information about all identity providers for a user pool.</p>\"\
    },\
    \"ListResourceServers\":{\
      \"name\":\"ListResourceServers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListResourceServersRequest\"},\
      \"output\":{\"shape\":\"ListResourceServersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the resource servers for a user pool.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags that are assigned to an Amazon Cognito user pool.</p> <p>A tag is a label that you can apply to user pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.</p> <p>You can use this action up to 10 times per second, per account.</p>\"\
    },\
    \"ListUserImportJobs\":{\
      \"name\":\"ListUserImportJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUserImportJobsRequest\"},\
      \"output\":{\"shape\":\"ListUserImportJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the user import jobs.</p>\"\
    },\
    \"ListUserPoolClients\":{\
      \"name\":\"ListUserPoolClients\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUserPoolClientsRequest\"},\
      \"output\":{\"shape\":\"ListUserPoolClientsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the clients that have been created for the specified user pool.</p>\"\
    },\
    \"ListUserPools\":{\
      \"name\":\"ListUserPools\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUserPoolsRequest\"},\
      \"output\":{\"shape\":\"ListUserPoolsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the user pools associated with an AWS account.</p>\"\
    },\
    \"ListUsers\":{\
      \"name\":\"ListUsers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUsersRequest\"},\
      \"output\":{\"shape\":\"ListUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the users in the Amazon Cognito user pool.</p>\"\
    },\
    \"ListUsersInGroup\":{\
      \"name\":\"ListUsersInGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListUsersInGroupRequest\"},\
      \"output\":{\"shape\":\"ListUsersInGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Lists the users in the specified group.</p> <p>Calling this action requires developer credentials.</p>\"\
    },\
    \"ResendConfirmationCode\":{\
      \"name\":\"ResendConfirmationCode\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ResendConfirmationCodeRequest\"},\
      \"output\":{\"shape\":\"ResendConfirmationCodeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Resends the confirmation (for confirmation of registration) to a specific user in the user pool.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"RespondToAuthChallenge\":{\
      \"name\":\"RespondToAuthChallenge\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RespondToAuthChallengeRequest\"},\
      \"output\":{\"shape\":\"RespondToAuthChallengeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"MFAMethodNotFoundException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"SoftwareTokenMFANotFoundException\"}\
      ],\
      \"documentation\":\"<p>Responds to the authentication challenge.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"SetRiskConfiguration\":{\
      \"name\":\"SetRiskConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetRiskConfigurationRequest\"},\
      \"output\":{\"shape\":\"SetRiskConfigurationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserPoolAddOnNotEnabledException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Configures actions on detected risks. To delete the risk configuration for <code>UserPoolId</code> or <code>ClientId</code>, pass null values for all four configuration types.</p> <p>To enable Amazon Cognito advanced security features, update the user pool to include the <code>UserPoolAddOns</code> key<code>AdvancedSecurityMode</code>.</p>\"\
    },\
    \"SetUICustomization\":{\
      \"name\":\"SetUICustomization\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetUICustomizationRequest\"},\
      \"output\":{\"shape\":\"SetUICustomizationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Sets the UI customization information for a user pool's built-in app UI.</p> <p>You can specify app UI customization settings for a single client (with a specific <code>clientId</code>) or for all clients (by setting the <code>clientId</code> to <code>ALL</code>). If you specify <code>ALL</code>, the default configuration will be used for every client that has no UI customization set previously. If you specify UI customization settings for a particular client, it will no longer fall back to the <code>ALL</code> configuration. </p> <note> <p>To use this API, your user pool must have a domain associated with it. Otherwise, there is no place to host the app's pages, and the service will throw an error.</p> </note>\"\
    },\
    \"SetUserMFAPreference\":{\
      \"name\":\"SetUserMFAPreference\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetUserMFAPreferenceRequest\"},\
      \"output\":{\"shape\":\"SetUserMFAPreferenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Set the user's multi-factor authentication (MFA) method preference, including which MFA factors are enabled and if any are preferred. Only one factor can be set as preferred. The preferred MFA factor will be used to authenticate a user if multiple factors are enabled. If multiple options are enabled and no preference is set, a challenge to choose an MFA option will be returned during sign in.</p>\"\
    },\
    \"SetUserPoolMfaConfig\":{\
      \"name\":\"SetUserPoolMfaConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetUserPoolMfaConfigRequest\"},\
      \"output\":{\"shape\":\"SetUserPoolMfaConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Set the user pool multi-factor authentication (MFA) configuration.</p>\"\
    },\
    \"SetUserSettings\":{\
      \"name\":\"SetUserSettings\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetUserSettingsRequest\"},\
      \"output\":{\"shape\":\"SetUserSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p> <i>This action is no longer supported.</i> You can use it to configure only SMS MFA. You can't use it to configure TOTP software token MFA. To configure either type of MFA, use <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserMFAPreference.html\\\">SetUserMFAPreference</a> instead.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"SignUp\":{\
      \"name\":\"SignUp\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SignUpRequest\"},\
      \"output\":{\"shape\":\"SignUpResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidPasswordException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"UsernameExistsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"}\
      ],\
      \"documentation\":\"<p>Registers the user in the specified user pool and creates a user name, password, and user attributes.</p>\",\
      \"authtype\":\"none\"\
    },\
    \"StartUserImportJob\":{\
      \"name\":\"StartUserImportJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartUserImportJobRequest\"},\
      \"output\":{\"shape\":\"StartUserImportJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Starts the user import.</p>\"\
    },\
    \"StopUserImportJob\":{\
      \"name\":\"StopUserImportJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopUserImportJobRequest\"},\
      \"output\":{\"shape\":\"StopUserImportJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"PreconditionNotMetException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Stops the user import job.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Assigns a set of tags to an Amazon Cognito user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.</p> <p>Each tag consists of a key and value, both of which you define. A key is a general category for more specific values. For example, if you have two versions of a user pool, one for testing and another for production, you might assign an <code>Environment</code> tag key to both user pools. The value of this key might be <code>Test</code> for one user pool and <code>Production</code> for the other.</p> <p>Tags are useful for cost tracking and access control. You can activate your tags so that they appear on the Billing and Cost Management console, where you can track the costs associated with your user pools. In an IAM policy, you can constrain permissions for user pools based on specific tags or tag values.</p> <p>You can use this action up to 5 times per second, per account. A user pool can have as many as 50 tags.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from an Amazon Cognito user pool. You can use this action up to 5 times per second, per account</p>\"\
    },\
    \"UpdateAuthEventFeedback\":{\
      \"name\":\"UpdateAuthEventFeedback\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateAuthEventFeedbackRequest\"},\
      \"output\":{\"shape\":\"UpdateAuthEventFeedbackResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserPoolAddOnNotEnabledException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Provides the feedback for an authentication event whether it was from a valid user or not. This feedback is used for improving the risk evaluation decision for the user pool as part of Amazon Cognito advanced security.</p>\"\
    },\
    \"UpdateDeviceStatus\":{\
      \"name\":\"UpdateDeviceStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDeviceStatusRequest\"},\
      \"output\":{\"shape\":\"UpdateDeviceStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the device status.</p>\"\
    },\
    \"UpdateGroup\":{\
      \"name\":\"UpdateGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateGroupRequest\"},\
      \"output\":{\"shape\":\"UpdateGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified group with the specified attributes.</p> <p>Calling this action requires developer credentials.</p> <important> <p>If you don't provide a value for an attribute, it will be set to the default value.</p> </important>\"\
    },\
    \"UpdateIdentityProvider\":{\
      \"name\":\"UpdateIdentityProvider\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateIdentityProviderRequest\"},\
      \"output\":{\"shape\":\"UpdateIdentityProviderResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"UnsupportedIdentityProviderException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates identity provider information for a user pool.</p>\"\
    },\
    \"UpdateResourceServer\":{\
      \"name\":\"UpdateResourceServer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateResourceServerRequest\"},\
      \"output\":{\"shape\":\"UpdateResourceServerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the name and scopes of resource server. All other fields are read-only.</p> <important> <p>If you don't provide a value for an attribute, it will be set to the default value.</p> </important>\"\
    },\
    \"UpdateUserAttributes\":{\
      \"name\":\"UpdateUserAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserAttributesRequest\"},\
      \"output\":{\"shape\":\"UpdateUserAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnexpectedLambdaException\"},\
        {\"shape\":\"UserLambdaValidationException\"},\
        {\"shape\":\"InvalidLambdaResponseException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"AliasExistsException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"},\
        {\"shape\":\"CodeDeliveryFailureException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Allows a user to update a specific attribute (one at a time).</p>\",\
      \"authtype\":\"none\"\
    },\
    \"UpdateUserPool\":{\
      \"name\":\"UpdateUserPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserPoolRequest\"},\
      \"output\":{\"shape\":\"UpdateUserPoolResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UserImportInProgressException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"InvalidSmsRoleAccessPolicyException\"},\
        {\"shape\":\"InvalidSmsRoleTrustRelationshipException\"},\
        {\"shape\":\"UserPoolTaggingException\"},\
        {\"shape\":\"InvalidEmailRoleAccessPolicyException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified user pool with the specified attributes. You can get a list of the current user pool settings using <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html\\\">DescribeUserPool</a>.</p> <important> <p>If you don't provide a value for an attribute, it will be set to the default value.</p> </important>\"\
    },\
    \"UpdateUserPoolClient\":{\
      \"name\":\"UpdateUserPoolClient\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserPoolClientRequest\"},\
      \"output\":{\"shape\":\"UpdateUserPoolClientResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ScopeDoesNotExistException\"},\
        {\"shape\":\"InvalidOAuthFlowException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified user pool app client with the specified attributes. You can get a list of the current user pool app client settings using <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPoolClient.html\\\">DescribeUserPoolClient</a>.</p> <important> <p>If you don't provide a value for an attribute, it will be set to the default value.</p> </important>\"\
    },\
    \"UpdateUserPoolDomain\":{\
      \"name\":\"UpdateUserPoolDomain\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateUserPoolDomainRequest\"},\
      \"output\":{\"shape\":\"UpdateUserPoolDomainResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Updates the Secure Sockets Layer (SSL) certificate for the custom domain for your user pool.</p> <p>You can use this operation to provide the Amazon Resource Name (ARN) of a new certificate to Amazon Cognito. You cannot use it to change the domain for a user pool.</p> <p>A custom domain is used to host the Amazon Cognito hosted UI, which provides sign-up and sign-in pages for your application. When you set up a custom domain, you provide a certificate that you manage with AWS Certificate Manager (ACM). When necessary, you can use this operation to change the certificate that you applied to your custom domain.</p> <p>Usually, this is unnecessary following routine certificate renewal with ACM. When you renew your existing certificate in ACM, the ARN for your certificate remains the same, and your custom domain uses the new certificate automatically.</p> <p>However, if you replace your existing certificate with a new one, ACM gives the new certificate a new ARN. To apply the new certificate to your custom domain, you must provide this ARN to Amazon Cognito.</p> <p>When you add your new certificate in ACM, you must choose US East (N. Virginia) as the AWS Region.</p> <p>After you submit your request, Amazon Cognito requires up to 1 hour to distribute your new certificate to your custom domain.</p> <p>For more information about adding a custom domain to your user pool, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html\\\">Using Your Own Domain for the Hosted UI</a>.</p>\"\
    },\
    \"VerifySoftwareToken\":{\
      \"name\":\"VerifySoftwareToken\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifySoftwareTokenRequest\"},\
      \"output\":{\"shape\":\"VerifySoftwareTokenResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidUserPoolConfigurationException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"},\
        {\"shape\":\"EnableSoftwareTokenMFAException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"SoftwareTokenMFANotFoundException\"},\
        {\"shape\":\"CodeMismatchException\"}\
      ],\
      \"documentation\":\"<p>Use this API to register a user's entered TOTP code and mark the user's software token MFA status as \\\"verified\\\" if successful. The request takes an access token or a session string, but not both.</p>\"\
    },\
    \"VerifyUserAttribute\":{\
      \"name\":\"VerifyUserAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"VerifyUserAttributeRequest\"},\
      \"output\":{\"shape\":\"VerifyUserAttributeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"CodeMismatchException\"},\
        {\"shape\":\"ExpiredCodeException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"PasswordResetRequiredException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"UserNotConfirmedException\"},\
        {\"shape\":\"InternalErrorException\"}\
      ],\
      \"documentation\":\"<p>Verifies the specified user attributes in the user pool.</p>\",\
      \"authtype\":\"none\"\
    }\
  },\
  \"shapes\":{\
    \"AWSAccountIdType\":{\"type\":\"string\"},\
    \"AccessTokenValidityType\":{\
      \"type\":\"integer\",\
      \"max\":86400,\
      \"min\":1\
    },\
    \"AccountRecoverySettingType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecoveryMechanisms\":{\
          \"shape\":\"RecoveryMechanismsType\",\
          \"documentation\":\"<p>The list of <code>RecoveryOptionTypes</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The data type for <code>AccountRecoverySetting</code>.</p>\"\
    },\
    \"AccountTakeoverActionNotifyType\":{\"type\":\"boolean\"},\
    \"AccountTakeoverActionType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Notify\",\
        \"EventAction\"\
      ],\
      \"members\":{\
        \"Notify\":{\
          \"shape\":\"AccountTakeoverActionNotifyType\",\
          \"documentation\":\"<p>Flag specifying whether to send a notification.</p>\"\
        },\
        \"EventAction\":{\
          \"shape\":\"AccountTakeoverEventActionType\",\
          \"documentation\":\"<p>The event action.</p> <ul> <li> <p> <code>BLOCK</code> Choosing this action will block the request.</p> </li> <li> <p> <code>MFA_IF_CONFIGURED</code> Throw MFA challenge if user has configured it, else allow the request.</p> </li> <li> <p> <code>MFA_REQUIRED</code> Throw MFA challenge if user has configured it, else block the request.</p> </li> <li> <p> <code>NO_ACTION</code> Allow the user sign-in.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Account takeover action type.</p>\"\
    },\
    \"AccountTakeoverActionsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LowAction\":{\
          \"shape\":\"AccountTakeoverActionType\",\
          \"documentation\":\"<p>Action to take for a low risk.</p>\"\
        },\
        \"MediumAction\":{\
          \"shape\":\"AccountTakeoverActionType\",\
          \"documentation\":\"<p>Action to take for a medium risk.</p>\"\
        },\
        \"HighAction\":{\
          \"shape\":\"AccountTakeoverActionType\",\
          \"documentation\":\"<p>Action to take for a high risk.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Account takeover actions type.</p>\"\
    },\
    \"AccountTakeoverEventActionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BLOCK\",\
        \"MFA_IF_CONFIGURED\",\
        \"MFA_REQUIRED\",\
        \"NO_ACTION\"\
      ]\
    },\
    \"AccountTakeoverRiskConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Actions\"],\
      \"members\":{\
        \"NotifyConfiguration\":{\
          \"shape\":\"NotifyConfigurationType\",\
          \"documentation\":\"<p>The notify configuration used to construct email notifications.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"AccountTakeoverActionsType\",\
          \"documentation\":\"<p>Account takeover risk configuration actions</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration for mitigation actions and notification for different levels of risk detected for a potential account takeover.</p>\"\
    },\
    \"AddCustomAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"CustomAttributes\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to add custom attributes.</p>\"\
        },\
        \"CustomAttributes\":{\
          \"shape\":\"CustomAttributesListType\",\
          \"documentation\":\"<p>An array of custom attributes, such as Mutable and Name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to add custom attributes.</p>\"\
    },\
    \"AddCustomAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to add custom attributes.</p>\"\
    },\
    \"AdminAddUserToGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"GroupName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The username for the user.</p>\"\
        },\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The group name.</p>\"\
        }\
      }\
    },\
    \"AdminConfirmSignUpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for which you want to confirm user registration.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name for which you want to confirm user registration.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>If your user pool configuration includes triggers, the AdminConfirmSignUp API action invokes the AWS Lambda function that is specified for the <i>post confirmation</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. In this payload, the <code>clientMetadata</code> attribute provides the data that you assigned to the ClientMetadata parameter in your AdminConfirmSignUp request. In your function code in AWS Lambda, you can process the ClientMetadata value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to confirm user registration.</p>\"\
    },\
    \"AdminConfirmSignUpResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to confirm registration.</p>\"\
    },\
    \"AdminCreateUserConfigType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowAdminCreateUserOnly\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Set to <code>True</code> if only the administrator is allowed to create user profiles. Set to <code>False</code> if users can sign themselves up via an app.</p>\"\
        },\
        \"UnusedAccountValidityDays\":{\
          \"shape\":\"AdminCreateUserUnusedAccountValidityDaysType\",\
          \"documentation\":\"<p>The user account expiration limit, in days, after which the account is no longer usable. To reset the account after that time limit, you must call <code>AdminCreateUser</code> again, specifying <code>\\\"RESEND\\\"</code> for the <code>MessageAction</code> parameter. The default value for this parameter is 7. </p> <note> <p>If you set a value for <code>TemporaryPasswordValidityDays</code> in <code>PasswordPolicy</code>, that value will be used and <code>UnusedAccountValidityDays</code> will be deprecated for that user pool. </p> </note>\"\
        },\
        \"InviteMessageTemplate\":{\
          \"shape\":\"MessageTemplateType\",\
          \"documentation\":\"<p>The message template to be used for the welcome message to new users.</p> <p>See also <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-message-customizations.html#cognito-user-pool-settings-user-invitation-message-customization\\\">Customizing User Invitation Messages</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration for creating a new user profile.</p>\"\
    },\
    \"AdminCreateUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where the user will be created.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The username for the user. Must be unique within the user pool. Must be a UTF-8 string between 1 and 128 characters. After the user is created, the username cannot be changed.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs that contain user attributes and attribute values to be set for the user to be created. You can create a user without specifying any attributes other than <code>Username</code>. However, any attributes that you specify as required (when creating a user pool or in the <b>Attributes</b> tab of the console) must be supplied either by you (in your call to <code>AdminCreateUser</code>) or by the user (when he or she signs up in response to your welcome message).</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p> <p>To send a message inviting the user to sign up, you must specify the user's email address or phone number. This can be done in your call to AdminCreateUser or in the <b>Users</b> tab of the Amazon Cognito console for managing your user pools.</p> <p>In your call to <code>AdminCreateUser</code>, you can set the <code>email_verified</code> attribute to <code>True</code>, and you can set the <code>phone_number_verified</code> attribute to <code>True</code>. (You can also do this by calling <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminUpdateUserAttributes.html\\\">AdminUpdateUserAttributes</a>.)</p> <ul> <li> <p> <b>email</b>: The email address of the user to whom the message that contains the code and username will be sent. Required if the <code>email_verified</code> attribute is set to <code>True</code>, or if <code>\\\"EMAIL\\\"</code> is specified in the <code>DesiredDeliveryMediums</code> parameter.</p> </li> <li> <p> <b>phone_number</b>: The phone number of the user to whom the message that contains the code and username will be sent. Required if the <code>phone_number_verified</code> attribute is set to <code>True</code>, or if <code>\\\"SMS\\\"</code> is specified in the <code>DesiredDeliveryMediums</code> parameter.</p> </li> </ul>\"\
        },\
        \"ValidationData\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>The user's validation data. This is an array of name-value pairs that contain user attributes and attribute values that you can use for custom validation, such as restricting the types of user accounts that can be registered. For example, you might choose to allow or disallow user sign-up based on the user's domain.</p> <p>To configure custom validation, you must create a Pre Sign-up Lambda trigger for the user pool as described in the Amazon Cognito Developer Guide. The Lambda trigger receives the validation data and uses it in the validation process.</p> <p>The user's validation data is not persisted.</p>\"\
        },\
        \"TemporaryPassword\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The user's temporary password. This password must conform to the password policy that you specified when you created the user pool.</p> <p>The temporary password is valid only once. To complete the Admin Create User flow, the user must enter the temporary password in the sign-in page along with a new password to be used in all future sign-ins.</p> <p>This parameter is not required. If you do not specify a value, Amazon Cognito generates one for you.</p> <p>The temporary password can only be used until the user account expiration limit that you specified when you created the user pool. To reset the account after that time limit, you must call <code>AdminCreateUser</code> again, specifying <code>\\\"RESEND\\\"</code> for the <code>MessageAction</code> parameter.</p>\"\
        },\
        \"ForceAliasCreation\":{\
          \"shape\":\"ForceAliasCreation\",\
          \"documentation\":\"<p>This parameter is only used if the <code>phone_number_verified</code> or <code>email_verified</code> attribute is set to <code>True</code>. Otherwise, it is ignored.</p> <p>If this parameter is set to <code>True</code> and the phone number or email address specified in the UserAttributes parameter already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user. The previous user will no longer be able to log in using that alias.</p> <p>If this parameter is set to <code>False</code>, the API throws an <code>AliasExistsException</code> error if the alias already exists. The default value is <code>False</code>.</p>\"\
        },\
        \"MessageAction\":{\
          \"shape\":\"MessageActionType\",\
          \"documentation\":\"<p>Set to <code>\\\"RESEND\\\"</code> to resend the invitation message to a user that already exists and reset the expiration limit on the user's account. Set to <code>\\\"SUPPRESS\\\"</code> to suppress sending the message. Only one value can be specified.</p>\"\
        },\
        \"DesiredDeliveryMediums\":{\
          \"shape\":\"DeliveryMediumListType\",\
          \"documentation\":\"<p>Specify <code>\\\"EMAIL\\\"</code> if email will be used to send the welcome message. Specify <code>\\\"SMS\\\"</code> if the phone number will be used. The default value is <code>\\\"SMS\\\"</code>. More than one value can be specified.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the AdminCreateUser API action, Amazon Cognito invokes the function that is assigned to the <i>pre sign-up</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminCreateUser request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to create a user in the specified user pool.</p>\"\
    },\
    \"AdminCreateUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"User\":{\
          \"shape\":\"UserType\",\
          \"documentation\":\"<p>The newly created user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to create the user.</p>\"\
    },\
    \"AdminCreateUserUnusedAccountValidityDaysType\":{\
      \"type\":\"integer\",\
      \"max\":365,\
      \"min\":0\
    },\
    \"AdminDeleteUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"UserAttributeNames\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to delete user attributes.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user from which you would like to delete attributes.</p>\"\
        },\
        \"UserAttributeNames\":{\
          \"shape\":\"AttributeNameListType\",\
          \"documentation\":\"<p>An array of strings representing the user attribute names you wish to delete.</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete user attributes as an administrator.</p>\"\
    },\
    \"AdminDeleteUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response received from the server for a request to delete user attributes.</p>\"\
    },\
    \"AdminDeleteUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to delete the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user as an administrator.</p>\"\
    },\
    \"AdminDisableProviderForUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"User\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"User\":{\
          \"shape\":\"ProviderUserIdentifierType\",\
          \"documentation\":\"<p>The user to be disabled.</p>\"\
        }\
      }\
    },\
    \"AdminDisableProviderForUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AdminDisableUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to disable the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to disable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to disable any user as an administrator.</p>\"\
    },\
    \"AdminDisableUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response received from the server to disable the user as an administrator.</p>\"\
    },\
    \"AdminEnableUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to enable the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to enable.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request that enables the user as an administrator.</p>\"\
    },\
    \"AdminEnableUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to enable a user as an administrator.</p>\"\
    },\
    \"AdminForgetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sends the forgot device request, as an administrator.</p>\"\
    },\
    \"AdminGetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceKey\",\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get the device, as an administrator.</p>\"\
    },\
    \"AdminGetDeviceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Device\"],\
      \"members\":{\
        \"Device\":{\
          \"shape\":\"DeviceType\",\
          \"documentation\":\"<p>The device.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Gets the device response, as an administrator.</p>\"\
    },\
    \"AdminGetUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to get information about the user.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to retrieve.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get the specified user as an administrator.</p>\"\
    },\
    \"AdminGetUserResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Username\"],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user about whom you are receiving information.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p>\"\
        },\
        \"UserCreateDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user was created.</p>\"\
        },\
        \"UserLastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user was last modified.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Indicates that the status is enabled.</p>\"\
        },\
        \"UserStatus\":{\
          \"shape\":\"UserStatusType\",\
          \"documentation\":\"<p>The user status. Can be one of the following:</p> <ul> <li> <p>UNCONFIRMED - User has been created but not confirmed.</p> </li> <li> <p>CONFIRMED - User has been confirmed.</p> </li> <li> <p>ARCHIVED - User is no longer active.</p> </li> <li> <p>COMPROMISED - User is disabled due to a potential security threat.</p> </li> <li> <p>UNKNOWN - User status is not known.</p> </li> <li> <p>RESET_REQUIRED - User is confirmed, but the user must request a code and reset his or her password before he or she can sign in.</p> </li> <li> <p>FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using a temporary password, but on first sign-in, the user must change his or her password to a new value before doing anything else. </p> </li> </ul>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p> <i>This response parameter is no longer supported.</i> It provides information only about SMS MFA configurations. It doesn't provide information about TOTP software token MFA configurations. To look up information about either type of MFA configuration, use UserMFASettingList instead.</p>\"\
        },\
        \"PreferredMfaSetting\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user's preferred MFA setting.</p>\"\
        },\
        \"UserMFASettingList\":{\
          \"shape\":\"UserMFASettingListType\",\
          \"documentation\":\"<p>The MFA options that are enabled for the user. The possible values in this list are <code>SMS_MFA</code> and <code>SOFTWARE_TOKEN_MFA</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server from the request to get the specified user as an administrator.</p>\"\
    },\
    \"AdminInitiateAuthRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\",\
        \"AuthFlow\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the Amazon Cognito user pool.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID.</p>\"\
        },\
        \"AuthFlow\":{\
          \"shape\":\"AuthFlowType\",\
          \"documentation\":\"<p>The authentication flow for this call to execute. The API action will depend on this value. For example:</p> <ul> <li> <p> <code>REFRESH_TOKEN_AUTH</code> will take in a valid refresh token and return new tokens.</p> </li> <li> <p> <code>USER_SRP_AUTH</code> will take in <code>USERNAME</code> and <code>SRP_A</code> and return the SRP variables to be used for next challenge execution.</p> </li> <li> <p> <code>USER_PASSWORD_AUTH</code> will take in <code>USERNAME</code> and <code>PASSWORD</code> and return the next challenge or tokens.</p> </li> </ul> <p>Valid values include:</p> <ul> <li> <p> <code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote Password (SRP) protocol.</p> </li> <li> <p> <code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication flow for refreshing the access token and ID token by supplying a valid refresh token.</p> </li> <li> <p> <code>CUSTOM_AUTH</code>: Custom authentication flow.</p> </li> <li> <p> <code>ADMIN_NO_SRP_AUTH</code>: Non-SRP authentication flow; you can pass in the USERNAME and PASSWORD directly if the flow is enabled for calling the app client.</p> </li> <li> <p> <code>USER_PASSWORD_AUTH</code>: Non-SRP authentication flow; USERNAME and PASSWORD are passed directly. If a user migration Lambda trigger is set, this flow will invoke the user migration Lambda if the USERNAME is not found in the user pool. </p> </li> <li> <p> <code>ADMIN_USER_PASSWORD_AUTH</code>: Admin-based user password authentication. This replaces the <code>ADMIN_NO_SRP_AUTH</code> authentication flow. In this flow, Cognito receives the password in the request instead of using the SRP process to verify passwords.</p> </li> </ul>\"\
        },\
        \"AuthParameters\":{\
          \"shape\":\"AuthParametersType\",\
          \"documentation\":\"<p>The authentication parameters. These are inputs corresponding to the <code>AuthFlow</code> that you are invoking. The required values depend on the value of <code>AuthFlow</code>:</p> <ul> <li> <p>For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p> </li> <li> <p>For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>: <code>REFRESH_TOKEN</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p> </li> <li> <p>For <code>ADMIN_NO_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>PASSWORD</code> (required), <code>DEVICE_KEY</code>.</p> </li> <li> <p>For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>DEVICE_KEY</code>. To start the authentication flow with password verification, include <code>ChallengeName: SRP_A</code> and <code>SRP_A: (The SRP_A Value)</code>.</p> </li> </ul>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for certain custom workflows that this action triggers.</p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the AdminInitiateAuth API action, Amazon Cognito invokes the AWS Lambda functions that are specified for various triggers. The ClientMetadata value is passed as input to the functions for only the following triggers:</p> <ul> <li> <p>Pre signup</p> </li> <li> <p>Pre authentication</p> </li> <li> <p>User migration</p> </li> </ul> <p>When Amazon Cognito invokes the functions for these triggers, it passes a JSON payload, which the function receives as input. This payload contains a <code>validationData</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminInitiateAuth request. In your function code in AWS Lambda, you can process the <code>validationData</code> value to enhance your workflow for your specific needs.</p> <p>When you use the AdminInitiateAuth API action, Amazon Cognito also invokes the functions for the following triggers, but it does not provide the ClientMetadata value as input:</p> <ul> <li> <p>Post authentication</p> </li> <li> <p>Custom message</p> </li> <li> <p>Pre token generation</p> </li> <li> <p>Create auth challenge</p> </li> <li> <p>Define auth challenge</p> </li> <li> <p>Verify auth challenge</p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The analytics metadata for collecting Amazon Pinpoint metrics for <code>AdminInitiateAuth</code> calls.</p>\"\
        },\
        \"ContextData\":{\
          \"shape\":\"ContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Initiates the authorization request, as an administrator.</p>\"\
    },\
    \"AdminInitiateAuthResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge which you are responding to with this call. This is returned to you in the <code>AdminInitiateAuth</code> response if you need to pass another challenge.</p> <ul> <li> <p> <code>MFA_SETUP</code>: If MFA is required, users who do not have at least one of the MFA methods set up are presented with an <code>MFA_SETUP</code> challenge. The user must set up at least one MFA type to continue to authenticate.</p> </li> <li> <p> <code>SELECT_MFA_TYPE</code>: Selects the MFA type. Valid MFA options are <code>SMS_MFA</code> for text SMS MFA, and <code>SOFTWARE_TOKEN_MFA</code> for TOTP software token MFA.</p> </li> <li> <p> <code>SMS_MFA</code>: Next challenge is to supply an <code>SMS_MFA_CODE</code>, delivered via SMS.</p> </li> <li> <p> <code>PASSWORD_VERIFIER</code>: Next challenge is to supply <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after the client-side SRP calculations.</p> </li> <li> <p> <code>CUSTOM_CHALLENGE</code>: This is returned if your custom authentication flow determines that the user should pass another challenge before tokens are issued.</p> </li> <li> <p> <code>DEVICE_SRP_AUTH</code>: If device tracking was enabled on your user pool and the previous challenges were passed, this challenge is returned so that Amazon Cognito can start tracking this device.</p> </li> <li> <p> <code>DEVICE_PASSWORD_VERIFIER</code>: Similar to <code>PASSWORD_VERIFIER</code>, but for devices only.</p> </li> <li> <p> <code>ADMIN_NO_SRP_AUTH</code>: This is returned if you need to authenticate with <code>USERNAME</code> and <code>PASSWORD</code> directly. An app client must be enabled to use this flow.</p> </li> <li> <p> <code>NEW_PASSWORD_REQUIRED</code>: For users which are required to change their passwords after successful first login. This challenge should be passed with <code>NEW_PASSWORD</code> and any other required attributes.</p> </li> </ul>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. If <code>AdminInitiateAuth</code> or <code>AdminRespondToAuthChallenge</code> API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>AdminRespondToAuthChallenge</code> API call.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters. These are returned to you in the <code>AdminInitiateAuth</code> response if you need to pass another challenge. The responses in this parameter should be used to compute inputs to the next call (<code>AdminRespondToAuthChallenge</code>).</p> <p>All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable).</p> <p>The value of the <code>USER_ID_FOR_SRP</code> attribute will be the user's actual username, not an alias (such as email address or phone number), even if you specified an alias in your call to <code>AdminInitiateAuth</code>. This is because, in the <code>AdminRespondToAuthChallenge</code> API <code>ChallengeResponses</code>, the <code>USERNAME</code> attribute cannot be an alias.</p>\"\
        },\
        \"AuthenticationResult\":{\
          \"shape\":\"AuthenticationResultType\",\
          \"documentation\":\"<p>The result of the authentication response. This is only returned if the caller does not need to pass another challenge. If the caller does need to pass another challenge before it gets tokens, <code>ChallengeName</code>, <code>ChallengeParameters</code>, and <code>Session</code> are returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Initiates the authentication response, as an administrator.</p>\"\
    },\
    \"AdminLinkProviderForUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"DestinationUser\",\
        \"SourceUser\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"DestinationUser\":{\
          \"shape\":\"ProviderUserIdentifierType\",\
          \"documentation\":\"<p>The existing user in the user pool to be linked to the external identity provider user account. Can be a native (Username + Password) Cognito User Pools user or a federated user (for example, a SAML or Facebook user). If the user doesn't exist, an exception is thrown. This is the user that is returned when the new user (with the linked identity provider attribute) signs in.</p> <p>For a native username + password user, the <code>ProviderAttributeValue</code> for the <code>DestinationUser</code> should be the username in the user pool. For a federated user, it should be the provider-specific <code>user_id</code>.</p> <p>The <code>ProviderAttributeName</code> of the <code>DestinationUser</code> is ignored.</p> <p>The <code>ProviderName</code> should be set to <code>Cognito</code> for users in Cognito user pools.</p>\"\
        },\
        \"SourceUser\":{\
          \"shape\":\"ProviderUserIdentifierType\",\
          \"documentation\":\"<p>An external identity provider account for a user who does not currently exist yet in the user pool. This user must be a federated user (for example, a SAML or Facebook user), not another native user.</p> <p>If the <code>SourceUser</code> is a federated social identity provider user (Facebook, Google, or Login with Amazon), you must set the <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>. For social identity providers, the <code>ProviderName</code> will be <code>Facebook</code>, <code>Google</code>, or <code>LoginWithAmazon</code>, and Cognito will automatically parse the Facebook, Google, and Login with Amazon tokens for <code>id</code>, <code>sub</code>, and <code>user_id</code>, respectively. The <code>ProviderAttributeValue</code> for the user must be the same value as the <code>id</code>, <code>sub</code>, or <code>user_id</code> value found in the social identity provider token.</p> <p/> <p>For SAML, the <code>ProviderAttributeName</code> can be any value that matches a claim in the SAML assertion. If you wish to link SAML users based on the subject of the SAML assertion, you should map the subject to a claim through the SAML identity provider and submit that claim name as the <code>ProviderAttributeName</code>. If you set <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>, Cognito will automatically parse the default unique identifier found in the subject from the SAML token.</p>\"\
        }\
      }\
    },\
    \"AdminLinkProviderForUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AdminListDevicesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the devices request.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list devices, as an administrator.</p>\"\
    },\
    \"AdminListDevicesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Devices\":{\
          \"shape\":\"DeviceListType\",\
          \"documentation\":\"<p>The devices in the list of devices response.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Lists the device's response, as an administrator.</p>\"\
    },\
    \"AdminListGroupsForUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Username\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The username for the user.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the request to list groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      }\
    },\
    \"AdminListGroupsForUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Groups\":{\
          \"shape\":\"GroupListType\",\
          \"documentation\":\"<p>The groups that the user belongs to.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      }\
    },\
    \"AdminListUserAuthEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user pool username or an alias.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The maximum number of authentication events to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>A pagination token.</p>\"\
        }\
      }\
    },\
    \"AdminListUserAuthEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AuthEvents\":{\
          \"shape\":\"AuthEventsType\",\
          \"documentation\":\"<p>The response object. It includes the <code>EventID</code>, <code>EventType</code>, <code>CreationDate</code>, <code>EventRisk</code>, and <code>EventResponse</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>A pagination token.</p>\"\
        }\
      }\
    },\
    \"AdminRemoveUserFromGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"GroupName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The username for the user.</p>\"\
        },\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The group name.</p>\"\
        }\
      }\
    },\
    \"AdminResetUserPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to reset the user's password.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user whose password you wish to reset.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the AdminResetUserPassword API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminResetUserPassword request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to reset a user's password as an administrator.</p>\"\
    },\
    \"AdminResetUserPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server to reset a user password as an administrator.</p>\"\
    },\
    \"AdminRespondToAuthChallengeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\",\
        \"ChallengeName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the Amazon Cognito user pool.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID.</p>\"\
        },\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The challenge name. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html\\\">AdminInitiateAuth</a>.</p>\"\
        },\
        \"ChallengeResponses\":{\
          \"shape\":\"ChallengeResponsesType\",\
          \"documentation\":\"<p>The challenge responses. These are inputs corresponding to the value of <code>ChallengeName</code>, for example:</p> <ul> <li> <p> <code>SMS_MFA</code>: <code>SMS_MFA_CODE</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret).</p> </li> <li> <p> <code>PASSWORD_VERIFIER</code>: <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, <code>TIMESTAMP</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret).</p> </li> <li> <p> <code>ADMIN_NO_SRP_AUTH</code>: <code>PASSWORD</code>, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret). </p> </li> <li> <p> <code>NEW_PASSWORD_REQUIRED</code>: <code>NEW_PASSWORD</code>, any other required attributes, <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is configured with client secret). </p> </li> </ul> <p>The value of the <code>USERNAME</code> attribute must be the user's actual username, not an alias (such as email address or phone number). To make this easier, the <code>AdminInitiateAuth</code> response includes the actual username value in the <code>USERNAMEUSER_ID_FOR_SRP</code> attribute, even if you specified an alias in your call to <code>AdminInitiateAuth</code>.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. If <code>InitiateAuth</code> or <code>RespondToAuthChallenge</code> API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The analytics metadata for collecting Amazon Pinpoint metrics for <code>AdminRespondToAuthChallenge</code> calls.</p>\"\
        },\
        \"ContextData\":{\
          \"shape\":\"ContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the AdminRespondToAuthChallenge API action, Amazon Cognito invokes any functions that are assigned to the following triggers: <i>pre sign-up</i>, <i>custom message</i>, <i>post authentication</i>, <i>user migration</i>, <i>pre token generation</i>, <i>define auth challenge</i>, <i>create auth challenge</i>, and <i>verify auth challenge response</i>. When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminRespondToAuthChallenge request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The request to respond to the authentication challenge, as an administrator.</p>\"\
    },\
    \"AdminRespondToAuthChallengeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html\\\">AdminInitiateAuth</a>.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. If the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html\\\">AdminInitiateAuth</a>.</p>\"\
        },\
        \"AuthenticationResult\":{\
          \"shape\":\"AuthenticationResultType\",\
          \"documentation\":\"<p>The result returned by the server in response to the authentication request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Responds to the authentication challenge, as an administrator.</p>\"\
    },\
    \"AdminSetUserMFAPreferenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Username\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"SMSMfaSettings\":{\
          \"shape\":\"SMSMfaSettingsType\",\
          \"documentation\":\"<p>The SMS text message MFA settings.</p>\"\
        },\
        \"SoftwareTokenMfaSettings\":{\
          \"shape\":\"SoftwareTokenMfaSettingsType\",\
          \"documentation\":\"<p>The time-based one-time password software token MFA settings.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user pool username or alias.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        }\
      }\
    },\
    \"AdminSetUserMFAPreferenceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AdminSetUserPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"Password\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to set the user's password.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user whose password you wish to set.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The password for the user.</p>\"\
        },\
        \"Permanent\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p> <code>True</code> if the password is permanent, <code>False</code> if it is temporary.</p>\"\
        }\
      }\
    },\
    \"AdminSetUserPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AdminSetUserSettingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"MFAOptions\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the user pool that contains the user that you are setting options for.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user that you are setting options for.</p>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p>You can use this parameter only to set an SMS configuration that uses SMS for delivery.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You can use this parameter to set an MFA configuration that uses the SMS delivery medium.</p>\"\
    },\
    \"AdminSetUserSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server to set user settings as an administrator.</p>\"\
    },\
    \"AdminUpdateAuthEventFeedbackRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"EventId\",\
        \"FeedbackValue\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user pool username.</p>\"\
        },\
        \"EventId\":{\
          \"shape\":\"EventIdType\",\
          \"documentation\":\"<p>The authentication event ID.</p>\"\
        },\
        \"FeedbackValue\":{\
          \"shape\":\"FeedbackValueType\",\
          \"documentation\":\"<p>The authentication event feedback value.</p>\"\
        }\
      }\
    },\
    \"AdminUpdateAuthEventFeedbackResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AdminUpdateDeviceStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceRememberedStatus\":{\
          \"shape\":\"DeviceRememberedStatusType\",\
          \"documentation\":\"<p>The status indicating whether a device has been remembered or not.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request to update the device status, as an administrator.</p>\"\
    },\
    \"AdminUpdateDeviceStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The status response from the request to update the device, as an administrator.</p>\"\
    },\
    \"AdminUpdateUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"UserAttributes\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to update user attributes.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user for whom you want to update user attributes.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the AdminUpdateUserAttributes API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your AdminUpdateUserAttributes request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the user's attributes as an administrator.</p>\"\
    },\
    \"AdminUpdateUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to update user attributes as an administrator.</p>\"\
    },\
    \"AdminUserGlobalSignOutRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request to sign out of all devices, as an administrator.</p>\"\
    },\
    \"AdminUserGlobalSignOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The global sign-out response, as an administrator.</p>\"\
    },\
    \"AdvancedSecurityModeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"AUDIT\",\
        \"ENFORCED\"\
      ]\
    },\
    \"AliasAttributeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"phone_number\",\
        \"email\",\
        \"preferred_username\"\
      ]\
    },\
    \"AliasAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AliasAttributeType\"}\
    },\
    \"AliasExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message sent to the user when an alias exists.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user tries to confirm the account with an email or phone number that has already been supplied as an alias from a different account. This exception tells user that an account with this email or phone already exists.</p>\",\
      \"exception\":true\
    },\
    \"AnalyticsConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ApplicationId\":{\
          \"shape\":\"HexStringType\",\
          \"documentation\":\"<p>The application ID for an Amazon Pinpoint application.</p>\"\
        },\
        \"ApplicationArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an Amazon Pinpoint project. You can use the Amazon Pinpoint project for Pinpoint integration with the chosen User Pool Client. Amazon Cognito publishes events to the pinpoint project declared by the app ARN.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The ARN of an IAM role that authorizes Amazon Cognito to publish events to Amazon Pinpoint analytics.</p>\"\
        },\
        \"ExternalId\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The external ID.</p>\"\
        },\
        \"UserDataShared\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>If <code>UserDataShared</code> is <code>true</code>, Amazon Cognito will include user data in the events it publishes to Amazon Pinpoint analytics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Pinpoint analytics configuration for collecting metrics for a user pool.</p> <note> <p>In regions where Pinpoint is not available, Cognito User Pools only supports sending events to Amazon Pinpoint projects in us-east-1. In regions where Pinpoint is available, Cognito User Pools will support sending events to Amazon Pinpoint projects within that same region. </p> </note>\"\
    },\
    \"AnalyticsMetadataType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AnalyticsEndpointId\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The endpoint ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An Amazon Pinpoint analytics endpoint.</p> <p>An endpoint uniquely identifies a mobile device, email address, or phone number that can receive messages from Amazon Pinpoint analytics.</p> <note> <p>Cognito User Pools only supports sending events to Amazon Pinpoint projects in the US East (N. Virginia) us-east-1 Region, regardless of the region in which the user pool resides.</p> </note>\"\
    },\
    \"ArnType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:[\\\\w+=/,.@-]+:[\\\\w+=/,.@-]+:([\\\\w+=/,.@-]*)?:[0-9]+:[\\\\w+=/,.@-]+(:[\\\\w+=/,.@-]+)?(:[\\\\w+=/,.@-]+)?\"\
    },\
    \"AssociateSoftwareTokenRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. This allows authentication of the user as part of the MFA setup process.</p>\"\
        }\
      }\
    },\
    \"AssociateSoftwareTokenResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecretCode\":{\
          \"shape\":\"SecretCodeType\",\
          \"documentation\":\"<p>A unique generated shared secret code that is used in the TOTP algorithm to generate a one time code.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. This allows authentication of the user as part of the MFA setup process.</p>\"\
        }\
      }\
    },\
    \"AttributeDataType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"String\",\
        \"Number\",\
        \"DateTime\",\
        \"Boolean\"\
      ]\
    },\
    \"AttributeListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeType\"}\
    },\
    \"AttributeMappingKeyType\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1\
    },\
    \"AttributeMappingType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AttributeMappingKeyType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"AttributeNameListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeNameType\"}\
    },\
    \"AttributeNameType\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"AttributeType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The name of the attribute.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"AttributeValueType\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies whether the attribute is standard or custom.</p>\"\
    },\
    \"AttributeValueType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"sensitive\":true\
    },\
    \"AuthEventType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventId\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The event ID.</p>\"\
        },\
        \"EventType\":{\
          \"shape\":\"EventType\",\
          \"documentation\":\"<p>The event type.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date</p>\"\
        },\
        \"EventResponse\":{\
          \"shape\":\"EventResponseType\",\
          \"documentation\":\"<p>The event response.</p>\"\
        },\
        \"EventRisk\":{\
          \"shape\":\"EventRiskType\",\
          \"documentation\":\"<p>The event risk.</p>\"\
        },\
        \"ChallengeResponses\":{\
          \"shape\":\"ChallengeResponseListType\",\
          \"documentation\":\"<p>The challenge responses.</p>\"\
        },\
        \"EventContextData\":{\
          \"shape\":\"EventContextDataType\",\
          \"documentation\":\"<p>The user context data captured at the time of an event request. It provides additional information about the client from which event the request is received.</p>\"\
        },\
        \"EventFeedback\":{\
          \"shape\":\"EventFeedbackType\",\
          \"documentation\":\"<p>A flag specifying the user feedback captured at the time of an event request is good or bad. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The authentication event type.</p>\"\
    },\
    \"AuthEventsType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AuthEventType\"}\
    },\
    \"AuthFlowType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USER_SRP_AUTH\",\
        \"REFRESH_TOKEN_AUTH\",\
        \"REFRESH_TOKEN\",\
        \"CUSTOM_AUTH\",\
        \"ADMIN_NO_SRP_AUTH\",\
        \"USER_PASSWORD_AUTH\",\
        \"ADMIN_USER_PASSWORD_AUTH\"\
      ]\
    },\
    \"AuthParametersType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"},\
      \"sensitive\":true\
    },\
    \"AuthenticationResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        },\
        \"ExpiresIn\":{\
          \"shape\":\"IntegerType\",\
          \"documentation\":\"<p>The expiration period of the authentication result in seconds.</p>\"\
        },\
        \"TokenType\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The token type.</p>\"\
        },\
        \"RefreshToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The refresh token.</p>\"\
        },\
        \"IdToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The ID token.</p>\"\
        },\
        \"NewDeviceMetadata\":{\
          \"shape\":\"NewDeviceMetadataType\",\
          \"documentation\":\"<p>The new device metadata from an authentication result.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The authentication result.</p>\"\
    },\
    \"BlockedIPRangeListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StringType\"},\
      \"max\":20\
    },\
    \"BooleanType\":{\"type\":\"boolean\"},\
    \"CSSType\":{\"type\":\"string\"},\
    \"CSSVersionType\":{\"type\":\"string\"},\
    \"CallbackURLsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RedirectUrlType\"},\
      \"max\":100,\
      \"min\":0\
    },\
    \"ChallengeName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Password\",\
        \"Mfa\"\
      ]\
    },\
    \"ChallengeNameType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SMS_MFA\",\
        \"SOFTWARE_TOKEN_MFA\",\
        \"SELECT_MFA_TYPE\",\
        \"MFA_SETUP\",\
        \"PASSWORD_VERIFIER\",\
        \"CUSTOM_CHALLENGE\",\
        \"DEVICE_SRP_AUTH\",\
        \"DEVICE_PASSWORD_VERIFIER\",\
        \"ADMIN_NO_SRP_AUTH\",\
        \"NEW_PASSWORD_REQUIRED\"\
      ]\
    },\
    \"ChallengeParametersType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"ChallengeResponse\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Success\",\
        \"Failure\"\
      ]\
    },\
    \"ChallengeResponseListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChallengeResponseType\"}\
    },\
    \"ChallengeResponseType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeName\",\
          \"documentation\":\"<p>The challenge name</p>\"\
        },\
        \"ChallengeResponse\":{\
          \"shape\":\"ChallengeResponse\",\
          \"documentation\":\"<p>The challenge response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The challenge response type.</p>\"\
    },\
    \"ChallengeResponsesType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"ChangePasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PreviousPassword\",\
        \"ProposedPassword\",\
        \"AccessToken\"\
      ],\
      \"members\":{\
        \"PreviousPassword\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The old password.</p>\"\
        },\
        \"ProposedPassword\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The new password.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to change a user password.</p>\"\
    },\
    \"ChangePasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response from the server to the change password request.</p>\"\
    },\
    \"ClientIdType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+]+\",\
      \"sensitive\":true\
    },\
    \"ClientMetadataType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"ClientNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\s+=,.@-]+\"\
    },\
    \"ClientPermissionListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ClientPermissionType\"}\
    },\
    \"ClientPermissionType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"ClientSecretType\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+]+\",\
      \"sensitive\":true\
    },\
    \"CodeDeliveryDetailsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CodeDeliveryDetailsType\"}\
    },\
    \"CodeDeliveryDetailsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Destination\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The destination for the code delivery details.</p>\"\
        },\
        \"DeliveryMedium\":{\
          \"shape\":\"DeliveryMediumType\",\
          \"documentation\":\"<p>The delivery medium (email message or phone number).</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The attribute name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The code delivery details being returned from the server.</p>\"\
    },\
    \"CodeDeliveryFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message sent when a verification code fails to deliver successfully.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a verification code fails to deliver successfully.</p>\",\
      \"exception\":true\
    },\
    \"CodeMismatchException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message provided when the code mismatch exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown if the provided code does not match what the server was expecting.</p>\",\
      \"exception\":true\
    },\
    \"CompletionMessageType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w]+\"\
    },\
    \"CompromisedCredentialsActionsType\":{\
      \"type\":\"structure\",\
      \"required\":[\"EventAction\"],\
      \"members\":{\
        \"EventAction\":{\
          \"shape\":\"CompromisedCredentialsEventActionType\",\
          \"documentation\":\"<p>The event action.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The compromised credentials actions type</p>\"\
    },\
    \"CompromisedCredentialsEventActionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BLOCK\",\
        \"NO_ACTION\"\
      ]\
    },\
    \"CompromisedCredentialsRiskConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Actions\"],\
      \"members\":{\
        \"EventFilter\":{\
          \"shape\":\"EventFiltersType\",\
          \"documentation\":\"<p>Perform the action for these events. The default is to perform all events if no event filter is specified.</p>\"\
        },\
        \"Actions\":{\
          \"shape\":\"CompromisedCredentialsActionsType\",\
          \"documentation\":\"<p>The compromised credentials risk configuration actions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The compromised credentials risk configuration type.</p>\"\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message provided when the concurrent exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown if two or more modifications are happening concurrently.</p>\",\
      \"exception\":true\
    },\
    \"ConfirmDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceSecretVerifierConfig\":{\
          \"shape\":\"DeviceSecretVerifierConfigType\",\
          \"documentation\":\"<p>The configuration of the device secret verifier.</p>\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"DeviceNameType\",\
          \"documentation\":\"<p>The device name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Confirms the device request.</p>\"\
    },\
    \"ConfirmDeviceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserConfirmationNecessary\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Indicates whether the user confirmation is necessary to confirm the device response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Confirms the device response.</p>\"\
    },\
    \"ConfirmForgotPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\",\
        \"ConfirmationCode\",\
        \"Password\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID of the app associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user for whom you want to enter a code to retrieve a forgotten password.</p>\"\
        },\
        \"ConfirmationCode\":{\
          \"shape\":\"ConfirmationCodeType\",\
          \"documentation\":\"<p>The confirmation code sent by a user's request to retrieve a forgotten password. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ForgotPassword.html\\\">ForgotPassword</a>.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The password sent by a user's request to retrieve a forgotten password.</p>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ConfirmForgotPassword</code> calls.</p>\"\
        },\
        \"UserContextData\":{\
          \"shape\":\"UserContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the ConfirmForgotPassword API action, Amazon Cognito invokes the function that is assigned to the <i>post confirmation</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ConfirmForgotPassword request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The request representing the confirmation for a password reset.</p>\"\
    },\
    \"ConfirmForgotPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response from the server that results from a user's request to retrieve a forgotten password.</p>\"\
    },\
    \"ConfirmSignUpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\",\
        \"ConfirmationCode\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the app client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user whose registration you wish to confirm.</p>\"\
        },\
        \"ConfirmationCode\":{\
          \"shape\":\"ConfirmationCodeType\",\
          \"documentation\":\"<p>The confirmation code sent by a user's request to confirm registration.</p>\"\
        },\
        \"ForceAliasCreation\":{\
          \"shape\":\"ForceAliasCreation\",\
          \"documentation\":\"<p>Boolean to be specified to force user confirmation irrespective of existing alias. By default set to <code>False</code>. If this parameter is set to <code>True</code> and the phone number/email used for sign up confirmation already exists as an alias with a different user, the API call will migrate the alias from the previous user to the newly created user being confirmed. If set to <code>False</code>, the API will throw an <b>AliasExistsException</b> error.</p>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ConfirmSignUp</code> calls.</p>\"\
        },\
        \"UserContextData\":{\
          \"shape\":\"UserContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the ConfirmSignUp API action, Amazon Cognito invokes the function that is assigned to the <i>post confirmation</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ConfirmSignUp request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to confirm registration of a user.</p>\"\
    },\
    \"ConfirmSignUpResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server for the registration confirmation.</p>\"\
    },\
    \"ConfirmationCodeType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"ContextDataType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IpAddress\",\
        \"ServerName\",\
        \"ServerPath\",\
        \"HttpHeaders\"\
      ],\
      \"members\":{\
        \"IpAddress\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>Source IP address of your user.</p>\"\
        },\
        \"ServerName\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>Your server endpoint where this API is invoked.</p>\"\
        },\
        \"ServerPath\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>Your server path where this API is invoked. </p>\"\
        },\
        \"HttpHeaders\":{\
          \"shape\":\"HttpHeaderList\",\
          \"documentation\":\"<p>HttpHeaders received on your server in same order.</p>\"\
        },\
        \"EncodedData\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>Encoded data containing device fingerprinting details, collected using the Amazon Cognito context data collection library.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contextual user data type used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
    },\
    \"CreateGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The name of the group. Must be unique.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>A string containing the description of the group.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The role ARN for the group.</p>\"\
        },\
        \"Precedence\":{\
          \"shape\":\"PrecedenceType\",\
          \"documentation\":\"<p>A nonnegative integer value that specifies the precedence of this group relative to the other groups that a user can belong to in the user pool. Zero is the highest precedence value. Groups with lower <code>Precedence</code> values take precedence over groups with higher or null <code>Precedence</code> values. If a user belongs to two or more groups, it is the group with the lowest precedence value whose role ARN will be used in the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims in the user's tokens.</p> <p>Two groups can have the same <code>Precedence</code> value. If this happens, neither group takes precedence over the other. If two groups with the same <code>Precedence</code> have the same role ARN, that role is used in the <code>cognito:preferred_role</code> claim in tokens for users in each group. If the two groups have different role ARNs, the <code>cognito:preferred_role</code> claim is not set in users' tokens.</p> <p>The default <code>Precedence</code> value is null.</p>\"\
        }\
      }\
    },\
    \"CreateGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Group\":{\
          \"shape\":\"GroupType\",\
          \"documentation\":\"<p>The group object for the group.</p>\"\
        }\
      }\
    },\
    \"CreateIdentityProviderRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ProviderName\",\
        \"ProviderType\",\
        \"ProviderDetails\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"ProviderName\":{\
          \"shape\":\"ProviderNameTypeV1\",\
          \"documentation\":\"<p>The identity provider name.</p>\"\
        },\
        \"ProviderType\":{\
          \"shape\":\"IdentityProviderTypeType\",\
          \"documentation\":\"<p>The identity provider type.</p>\"\
        },\
        \"ProviderDetails\":{\
          \"shape\":\"ProviderDetailsType\",\
          \"documentation\":\"<p>The identity provider details. The following list describes the provider detail keys for each identity provider type.</p> <ul> <li> <p>For Google and Login with Amazon:</p> <ul> <li> <p>client_id</p> </li> <li> <p>client_secret</p> </li> <li> <p>authorize_scopes</p> </li> </ul> </li> <li> <p>For Facebook:</p> <ul> <li> <p>client_id</p> </li> <li> <p>client_secret</p> </li> <li> <p>authorize_scopes</p> </li> <li> <p>api_version</p> </li> </ul> </li> <li> <p>For Sign in with Apple:</p> <ul> <li> <p>client_id</p> </li> <li> <p>team_id</p> </li> <li> <p>key_id</p> </li> <li> <p>private_key</p> </li> <li> <p>authorize_scopes</p> </li> </ul> </li> <li> <p>For OIDC providers:</p> <ul> <li> <p>client_id</p> </li> <li> <p>client_secret</p> </li> <li> <p>attributes_request_method</p> </li> <li> <p>oidc_issuer</p> </li> <li> <p>authorize_scopes</p> </li> <li> <p>authorize_url <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> <li> <p>token_url <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> <li> <p>attributes_url <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> <li> <p>jwks_uri <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> </ul> </li> <li> <p>For SAML providers:</p> <ul> <li> <p>MetadataFile OR MetadataURL</p> </li> <li> <p>IDPSignout <i>optional</i> </p> </li> </ul> </li> </ul>\"\
        },\
        \"AttributeMapping\":{\
          \"shape\":\"AttributeMappingType\",\
          \"documentation\":\"<p>A mapping of identity provider attributes to standard and custom user pool attributes.</p>\"\
        },\
        \"IdpIdentifiers\":{\
          \"shape\":\"IdpIdentifiersListType\",\
          \"documentation\":\"<p>A list of identity provider identifiers.</p>\"\
        }\
      }\
    },\
    \"CreateIdentityProviderResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityProvider\"],\
      \"members\":{\
        \"IdentityProvider\":{\
          \"shape\":\"IdentityProviderType\",\
          \"documentation\":\"<p>The newly created identity provider object.</p>\"\
        }\
      }\
    },\
    \"CreateResourceServerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Identifier\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Identifier\":{\
          \"shape\":\"ResourceServerIdentifierType\",\
          \"documentation\":\"<p>A unique resource server identifier for the resource server. This could be an HTTPS endpoint where the resource server is located. For example, <code>https://my-weather-api.example.com</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceServerNameType\",\
          \"documentation\":\"<p>A friendly name for the resource server.</p>\"\
        },\
        \"Scopes\":{\
          \"shape\":\"ResourceServerScopeListType\",\
          \"documentation\":\"<p>A list of scopes. Each scope is map, where the keys are <code>name</code> and <code>description</code>.</p>\"\
        }\
      }\
    },\
    \"CreateResourceServerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceServer\"],\
      \"members\":{\
        \"ResourceServer\":{\
          \"shape\":\"ResourceServerType\",\
          \"documentation\":\"<p>The newly created resource server.</p>\"\
        }\
      }\
    },\
    \"CreateUserImportJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"JobName\",\
        \"UserPoolId\",\
        \"CloudWatchLogsRoleArn\"\
      ],\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"UserImportJobNameType\",\
          \"documentation\":\"<p>The job name for the user import job.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are being imported into.</p>\"\
        },\
        \"CloudWatchLogsRoleArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The role ARN for the Amazon CloudWatch Logging role for the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to create the user import job.</p>\"\
    },\
    \"CreateUserImportJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserImportJob\":{\
          \"shape\":\"UserImportJobType\",\
          \"documentation\":\"<p>The job object that represents the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to create the user import job.</p>\"\
    },\
    \"CreateUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to create a user pool client.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name for the user pool client you would like to create.</p>\"\
        },\
        \"GenerateSecret\":{\
          \"shape\":\"GenerateSecret\",\
          \"documentation\":\"<p>Boolean to specify whether you want to generate a secret for the user pool client being created.</p>\"\
        },\
        \"RefreshTokenValidity\":{\
          \"shape\":\"RefreshTokenValidityType\",\
          \"documentation\":\"<p>The time limit, in days, after which the refresh token is no longer valid and cannot be used.</p>\"\
        },\
        \"AccessTokenValidity\":{\
          \"shape\":\"AccessTokenValidityType\",\
          \"documentation\":\"<p>The time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. This value will be overridden if you have entered a value in TokenValidityUnits.</p>\"\
        },\
        \"IdTokenValidity\":{\
          \"shape\":\"IdTokenValidityType\",\
          \"documentation\":\"<p>The time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. This value will be overridden if you have entered a value in TokenValidityUnits.</p>\"\
        },\
        \"TokenValidityUnits\":{\
          \"shape\":\"TokenValidityUnitsType\",\
          \"documentation\":\"<p>The units in which the validity times are represented in. Default for RefreshToken is days, and default for ID and access tokens are hours.</p>\"\
        },\
        \"ReadAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The read attributes.</p>\"\
        },\
        \"WriteAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The user pool attributes that the app client can write to.</p> <p>If your app client allows users to sign in through an identity provider, this array must include all attributes that are mapped to identity provider attributes. Amazon Cognito updates mapped attributes when users sign in to your application through an identity provider. If your app client lacks write access to a mapped attribute, Amazon Cognito throws an error when it attempts to update the attribute. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html\\\">Specifying Identity Provider Attribute Mappings for Your User Pool</a>.</p>\"\
        },\
        \"ExplicitAuthFlows\":{\
          \"shape\":\"ExplicitAuthFlowsListType\",\
          \"documentation\":\"<p>The authentication flows that are supported by the user pool clients. Flow names without the <code>ALLOW_</code> prefix are deprecated in favor of new names with the <code>ALLOW_</code> prefix. Note that values with <code>ALLOW_</code> prefix cannot be used along with values without <code>ALLOW_</code> prefix.</p> <p>Valid values include:</p> <ul> <li> <p> <code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this authentication flow, Cognito receives the password in the request instead of using the SRP (Secure Remote Password protocol) protocol to verify passwords.</p> </li> <li> <p> <code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based authentication.</p> </li> <li> <p> <code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based authentication. In this flow, Cognito receives the password in the request instead of using the SRP protocol to verify passwords.</p> </li> <li> <p> <code>ALLOW_USER_SRP_AUTH</code>: Enable SRP based authentication.</p> </li> <li> <p> <code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.</p> </li> </ul>\"\
        },\
        \"SupportedIdentityProviders\":{\
          \"shape\":\"SupportedIdentityProvidersListType\",\
          \"documentation\":\"<p>A list of provider names for the identity providers that are supported on this client. The following are supported: <code>COGNITO</code>, <code>Facebook</code>, <code>Google</code> and <code>LoginWithAmazon</code>.</p>\"\
        },\
        \"CallbackURLs\":{\
          \"shape\":\"CallbackURLsListType\",\
          \"documentation\":\"<p>A list of allowed redirect (callback) URLs for the identity providers.</p> <p>A redirect URI must:</p> <ul> <li> <p>Be an absolute URI.</p> </li> <li> <p>Be registered with the authorization server.</p> </li> <li> <p>Not include a fragment component.</p> </li> </ul> <p>See <a href=\\\"https://tools.ietf.org/html/rfc6749#section-3.1.2\\\">OAuth 2.0 - Redirection Endpoint</a>.</p> <p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p> <p>App callback URLs such as myapp://example are also supported.</p>\"\
        },\
        \"LogoutURLs\":{\
          \"shape\":\"LogoutURLsListType\",\
          \"documentation\":\"<p>A list of allowed logout URLs for the identity providers.</p>\"\
        },\
        \"DefaultRedirectURI\":{\
          \"shape\":\"RedirectUrlType\",\
          \"documentation\":\"<p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p> <p>A redirect URI must:</p> <ul> <li> <p>Be an absolute URI.</p> </li> <li> <p>Be registered with the authorization server.</p> </li> <li> <p>Not include a fragment component.</p> </li> </ul> <p>See <a href=\\\"https://tools.ietf.org/html/rfc6749#section-3.1.2\\\">OAuth 2.0 - Redirection Endpoint</a>.</p> <p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p> <p>App callback URLs such as myapp://example are also supported.</p>\"\
        },\
        \"AllowedOAuthFlows\":{\
          \"shape\":\"OAuthFlowsType\",\
          \"documentation\":\"<p>The allowed OAuth flows.</p> <p>Set to <code>code</code> to initiate a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the token endpoint.</p> <p>Set to <code>implicit</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) directly.</p> <p>Set to <code>client_credentials</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) from the token endpoint using a combination of client and client_secret.</p>\"\
        },\
        \"AllowedOAuthScopes\":{\
          \"shape\":\"ScopeListType\",\
          \"documentation\":\"<p>The allowed OAuth scopes. Possible values provided by OAuth are: <code>phone</code>, <code>email</code>, <code>openid</code>, and <code>profile</code>. Possible values provided by AWS are: <code>aws.cognito.signin.user.admin</code>. Custom scopes created in Resource Servers are also supported.</p>\"\
        },\
        \"AllowedOAuthFlowsUserPoolClient\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Set to true if the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.</p>\"\
        },\
        \"AnalyticsConfiguration\":{\
          \"shape\":\"AnalyticsConfigurationType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics configuration for collecting metrics for this user pool.</p> <note> <p>In regions where Pinpoint is not available, Cognito User Pools only supports sending events to Amazon Pinpoint projects in us-east-1. In regions where Pinpoint is available, Cognito User Pools will support sending events to Amazon Pinpoint projects within that same region. </p> </note>\"\
        },\
        \"PreventUserExistenceErrors\":{\
          \"shape\":\"PreventUserExistenceErrorTypes\",\
          \"documentation\":\"<p>Use this setting to choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. When set to <code>ENABLED</code> and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to <code>LEGACY</code>, those APIs will return a <code>UserNotFoundException</code> exception if the user does not exist in the user pool.</p> <p>Valid values include:</p> <ul> <li> <p> <code>ENABLED</code> - This prevents user existence-related errors.</p> </li> <li> <p> <code>LEGACY</code> - This represents the old behavior of Cognito where user existence related errors are not prevented.</p> </li> </ul> <note> <p>After February 15th 2020, the value of <code>PreventUserExistenceErrors</code> will default to <code>ENABLED</code> for newly created user pool clients if no value is provided.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to create a user pool client.</p>\"\
    },\
    \"CreateUserPoolClientResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClient\":{\
          \"shape\":\"UserPoolClientType\",\
          \"documentation\":\"<p>The user pool client that was just created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to create a user pool client.</p>\"\
    },\
    \"CreateUserPoolDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Domain\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The domain string.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"CustomDomainConfig\":{\
          \"shape\":\"CustomDomainConfigType\",\
          \"documentation\":\"<p>The configuration for a custom domain that hosts the sign-up and sign-in webpages for your application.</p> <p>Provide this parameter only if you want to use a custom domain for your user pool. Otherwise, you can exclude this parameter and use the Amazon Cognito hosted domain instead.</p> <p>For more information about the hosted domain and custom domains, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-assign-domain.html\\\">Configuring a User Pool Domain</a>.</p>\"\
        }\
      }\
    },\
    \"CreateUserPoolDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CloudFrontDomain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The Amazon CloudFront endpoint that you use as the target of the alias that you set up with your Domain Name Service (DNS) provider.</p>\"\
        }\
      }\
    },\
    \"CreateUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PoolName\"],\
      \"members\":{\
        \"PoolName\":{\
          \"shape\":\"UserPoolNameType\",\
          \"documentation\":\"<p>A string used to name the user pool.</p>\"\
        },\
        \"Policies\":{\
          \"shape\":\"UserPoolPolicyType\",\
          \"documentation\":\"<p>The policies associated with the new user pool.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>The Lambda trigger configuration information for the new user pool.</p> <note> <p>In a push model, event sources (such as Amazon S3 and custom applications) need permission to invoke a function. So you will need to make an extra call to add permission for these event sources to invoke your Lambda function.</p> <p/> <p>For more information on using the Lambda API to add permission, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/API_AddPermission.html\\\"> AddPermission </a>. </p> <p>For adding permission using the AWS CLI, see <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/lambda/add-permission.html\\\"> add-permission </a>.</p> </note>\"\
        },\
        \"AutoVerifiedAttributes\":{\
          \"shape\":\"VerifiedAttributesListType\",\
          \"documentation\":\"<p>The attributes to be auto-verified. Possible values: <b>email</b>, <b>phone_number</b>.</p>\"\
        },\
        \"AliasAttributes\":{\
          \"shape\":\"AliasAttributesListType\",\
          \"documentation\":\"<p>Attributes supported as an alias for this user pool. Possible values: <b>phone_number</b>, <b>email</b>, or <b>preferred_username</b>.</p>\"\
        },\
        \"UsernameAttributes\":{\
          \"shape\":\"UsernameAttributesListType\",\
          \"documentation\":\"<p>Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up.</p>\"\
        },\
        \"SmsVerificationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>A string representing the SMS verification message.</p>\"\
        },\
        \"EmailVerificationMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>A string representing the email verification message.</p>\"\
        },\
        \"EmailVerificationSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>A string representing the email verification subject.</p>\"\
        },\
        \"VerificationMessageTemplate\":{\
          \"shape\":\"VerificationMessageTemplateType\",\
          \"documentation\":\"<p>The template for the verification message that the user sees when the app requests permission to access the user's information.</p>\"\
        },\
        \"SmsAuthenticationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>A string representing the SMS authentication message.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>Specifies MFA configuration details.</p>\"\
        },\
        \"DeviceConfiguration\":{\
          \"shape\":\"DeviceConfigurationType\",\
          \"documentation\":\"<p>The device configuration.</p>\"\
        },\
        \"EmailConfiguration\":{\
          \"shape\":\"EmailConfigurationType\",\
          \"documentation\":\"<p>The email configuration.</p>\"\
        },\
        \"SmsConfiguration\":{\
          \"shape\":\"SmsConfigurationType\",\
          \"documentation\":\"<p>The SMS configuration.</p>\"\
        },\
        \"UserPoolTags\":{\
          \"shape\":\"UserPoolTagsType\",\
          \"documentation\":\"<p>The tag keys and values to assign to the user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.</p>\"\
        },\
        \"AdminCreateUserConfig\":{\
          \"shape\":\"AdminCreateUserConfigType\",\
          \"documentation\":\"<p>The configuration for <code>AdminCreateUser</code> requests.</p>\"\
        },\
        \"Schema\":{\
          \"shape\":\"SchemaAttributesListType\",\
          \"documentation\":\"<p>An array of schema attributes for the new user pool. These attributes can be standard or custom attributes.</p>\"\
        },\
        \"UserPoolAddOns\":{\
          \"shape\":\"UserPoolAddOnsType\",\
          \"documentation\":\"<p>Used to enable advanced security risk detection. Set the key <code>AdvancedSecurityMode</code> to the value \\\"AUDIT\\\".</p>\"\
        },\
        \"UsernameConfiguration\":{\
          \"shape\":\"UsernameConfigurationType\",\
          \"documentation\":\"<p>You can choose to set case sensitivity on the username input for the selected sign-in option. For example, when this is set to <code>False</code>, users will be able to sign in using either \\\"username\\\" or \\\"Username\\\". This configuration is immutable once it has been set. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UsernameConfigurationType.html\\\">UsernameConfigurationType</a>.</p>\"\
        },\
        \"AccountRecoverySetting\":{\
          \"shape\":\"AccountRecoverySettingType\",\
          \"documentation\":\"<p>Use this setting to define which verified available method a user can use to recover their password when they call <code>ForgotPassword</code>. It allows you to define a preferred method when a user has more than one method available. With this setting, SMS does not qualify for a valid password recovery mechanism if the user also has SMS MFA enabled. In the absence of this setting, Cognito uses the legacy behavior to determine the recovery method where SMS is preferred over email.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to create a user pool.</p>\"\
    },\
    \"CreateUserPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPool\":{\
          \"shape\":\"UserPoolType\",\
          \"documentation\":\"<p>A container for the user pool details.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to create a user pool.</p>\"\
    },\
    \"CustomAttributeNameType\":{\
      \"type\":\"string\",\
      \"max\":20,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"CustomAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SchemaAttributeType\"},\
      \"max\":25,\
      \"min\":1\
    },\
    \"CustomDomainConfigType\":{\
      \"type\":\"structure\",\
      \"required\":[\"CertificateArn\"],\
      \"members\":{\
        \"CertificateArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an AWS Certificate Manager SSL certificate. You use this certificate for the subdomain of your custom domain.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration for a custom domain that hosts the sign-up and sign-in webpages for your application.</p>\"\
    },\
    \"DateType\":{\"type\":\"timestamp\"},\
    \"DefaultEmailOptionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONFIRM_WITH_LINK\",\
        \"CONFIRM_WITH_CODE\"\
      ]\
    },\
    \"DeleteGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        }\
      }\
    },\
    \"DeleteIdentityProviderRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ProviderName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"ProviderName\":{\
          \"shape\":\"ProviderNameType\",\
          \"documentation\":\"<p>The identity provider name.</p>\"\
        }\
      }\
    },\
    \"DeleteResourceServerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Identifier\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that hosts the resource server.</p>\"\
        },\
        \"Identifier\":{\
          \"shape\":\"ResourceServerIdentifierType\",\
          \"documentation\":\"<p>The identifier for the resource server.</p>\"\
        }\
      }\
    },\
    \"DeleteUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserAttributeNames\",\
        \"AccessToken\"\
      ],\
      \"members\":{\
        \"UserAttributeNames\":{\
          \"shape\":\"AttributeNameListType\",\
          \"documentation\":\"<p>An array of strings representing the user attribute names you wish to delete.</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token used in the request to delete user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete user attributes.</p>\"\
    },\
    \"DeleteUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server to delete user attributes.</p>\"\
    },\
    \"DeleteUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to delete the client.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID of the app associated with the user pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user pool client.</p>\"\
    },\
    \"DeleteUserPoolDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Domain\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The domain string.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        }\
      }\
    },\
    \"DeleteUserPoolDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to delete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user pool.</p>\"\
    },\
    \"DeleteUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccessToken\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token from a request to delete a user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to delete a user.</p>\"\
    },\
    \"DeliveryMediumListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeliveryMediumType\"}\
    },\
    \"DeliveryMediumType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SMS\",\
        \"EMAIL\"\
      ]\
    },\
    \"DescribeIdentityProviderRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ProviderName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"ProviderName\":{\
          \"shape\":\"ProviderNameType\",\
          \"documentation\":\"<p>The identity provider name.</p>\"\
        }\
      }\
    },\
    \"DescribeIdentityProviderResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityProvider\"],\
      \"members\":{\
        \"IdentityProvider\":{\
          \"shape\":\"IdentityProviderType\",\
          \"documentation\":\"<p>The identity provider that was deleted.</p>\"\
        }\
      }\
    },\
    \"DescribeResourceServerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Identifier\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that hosts the resource server.</p>\"\
        },\
        \"Identifier\":{\
          \"shape\":\"ResourceServerIdentifierType\",\
          \"documentation\":\"<p>The identifier for the resource server</p>\"\
        }\
      }\
    },\
    \"DescribeResourceServerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceServer\"],\
      \"members\":{\
        \"ResourceServer\":{\
          \"shape\":\"ResourceServerType\",\
          \"documentation\":\"<p>The resource server.</p>\"\
        }\
      }\
    },\
    \"DescribeRiskConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID.</p>\"\
        }\
      }\
    },\
    \"DescribeRiskConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"RiskConfiguration\"],\
      \"members\":{\
        \"RiskConfiguration\":{\
          \"shape\":\"RiskConfigurationType\",\
          \"documentation\":\"<p>The risk configuration.</p>\"\
        }\
      }\
    },\
    \"DescribeUserImportJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"JobId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are being imported into.</p>\"\
        },\
        \"JobId\":{\
          \"shape\":\"UserImportJobIdType\",\
          \"documentation\":\"<p>The job ID for the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to describe the user import job.</p>\"\
    },\
    \"DescribeUserImportJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserImportJob\":{\
          \"shape\":\"UserImportJobType\",\
          \"documentation\":\"<p>The job object that represents the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to describe the user import job.</p>\"\
    },\
    \"DescribeUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to describe.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID of the app associated with the user pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to describe a user pool client.</p>\"\
    },\
    \"DescribeUserPoolClientResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClient\":{\
          \"shape\":\"UserPoolClientType\",\
          \"documentation\":\"<p>The user pool client from a server response to describe the user pool client.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server from a request to describe the user pool client.</p>\"\
    },\
    \"DescribeUserPoolDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Domain\"],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The domain string.</p>\"\
        }\
      }\
    },\
    \"DescribeUserPoolDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DomainDescription\":{\
          \"shape\":\"DomainDescriptionType\",\
          \"documentation\":\"<p>A domain description object containing information about the domain.</p>\"\
        }\
      }\
    },\
    \"DescribeUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to describe.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to describe the user pool.</p>\"\
    },\
    \"DescribeUserPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPool\":{\
          \"shape\":\"UserPoolType\",\
          \"documentation\":\"<p>The container of metadata returned by the server to describe the pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response to describe the user pool.</p>\"\
    },\
    \"DescriptionType\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"DeviceConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeRequiredOnNewDevice\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Indicates whether a challenge is required on a new device. Only applicable to a new device.</p>\"\
        },\
        \"DeviceOnlyRememberedOnUserPrompt\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>If true, a device is only remembered on user prompt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration for the user pool's device tracking.</p>\"\
    },\
    \"DeviceKeyType\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]+_[0-9a-f-]+\"\
    },\
    \"DeviceListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeviceType\"}\
    },\
    \"DeviceNameType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"DeviceRememberedStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"remembered\",\
        \"not_remembered\"\
      ]\
    },\
    \"DeviceSecretVerifierConfigType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PasswordVerifier\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The password verifier.</p>\"\
        },\
        \"Salt\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The salt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The device verifier against which it will be authenticated.</p>\"\
    },\
    \"DeviceType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>The device attributes.</p>\"\
        },\
        \"DeviceCreateDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date of the device.</p>\"\
        },\
        \"DeviceLastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date of the device.</p>\"\
        },\
        \"DeviceLastAuthenticatedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date in which the device was last authenticated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The device type.</p>\"\
    },\
    \"DomainDescriptionType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"AWSAccountId\":{\
          \"shape\":\"AWSAccountIdType\",\
          \"documentation\":\"<p>The AWS account ID for the user pool owner.</p>\"\
        },\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The domain string.</p>\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"S3BucketType\",\
          \"documentation\":\"<p>The S3 bucket where the static files for this domain are stored.</p>\"\
        },\
        \"CloudFrontDistribution\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The ARN of the CloudFront distribution.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"DomainVersionType\",\
          \"documentation\":\"<p>The app version.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DomainStatusType\",\
          \"documentation\":\"<p>The domain status.</p>\"\
        },\
        \"CustomDomainConfig\":{\
          \"shape\":\"CustomDomainConfigType\",\
          \"documentation\":\"<p>The configuration for a custom domain that hosts the sign-up and sign-in webpages for your application.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container for information about a domain.</p>\"\
    },\
    \"DomainStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATING\",\
        \"DELETING\",\
        \"UPDATING\",\
        \"ACTIVE\",\
        \"FAILED\"\
      ]\
    },\
    \"DomainType\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-z0-9](?:[a-z0-9\\\\-]{0,61}[a-z0-9])?$\"\
    },\
    \"DomainVersionType\":{\
      \"type\":\"string\",\
      \"max\":20,\
      \"min\":1\
    },\
    \"DuplicateProviderException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when the provider is already supported by the user pool.</p>\",\
      \"exception\":true\
    },\
    \"EmailAddressType\":{\
      \"type\":\"string\",\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+@[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"EmailConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a verified email address in Amazon SES. This email address is used in one of the following ways, depending on the value that you specify for the <code>EmailSendingAccount</code> parameter:</p> <ul> <li> <p>If you specify <code>COGNITO_DEFAULT</code>, Amazon Cognito uses this address as the custom FROM address when it emails your users by using its built-in email account.</p> </li> <li> <p>If you specify <code>DEVELOPER</code>, Amazon Cognito emails your users with this address by calling Amazon SES on your behalf.</p> </li> </ul>\"\
        },\
        \"ReplyToEmailAddress\":{\
          \"shape\":\"EmailAddressType\",\
          \"documentation\":\"<p>The destination to which the receiver of the email should reply to.</p>\"\
        },\
        \"EmailSendingAccount\":{\
          \"shape\":\"EmailSendingAccountType\",\
          \"documentation\":\"<p>Specifies whether Amazon Cognito emails your users by using its built-in email functionality or your Amazon SES email configuration. Specify one of the following values:</p> <dl> <dt>COGNITO_DEFAULT</dt> <dd> <p>When Amazon Cognito emails your users, it uses its built-in email functionality. When you use the default option, Amazon Cognito allows only a limited number of emails each day for your user pool. For typical production environments, the default email limit is below the required delivery volume. To achieve a higher delivery volume, specify DEVELOPER to use your Amazon SES email configuration.</p> <p>To look up the email delivery limit for the default option, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/limits.html\\\">Limits in Amazon Cognito</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <p>The default FROM address is no-reply@verificationemail.com. To customize the FROM address, provide the ARN of an Amazon SES verified email address for the <code>SourceArn</code> parameter.</p> </dd> <dt>DEVELOPER</dt> <dd> <p>When Amazon Cognito emails your users, it uses your Amazon SES configuration. Amazon Cognito calls Amazon SES on your behalf to send email from your verified email address. When you use this option, the email delivery limits are the same limits that apply to your Amazon SES verified email address in your AWS account.</p> <p>If you use this option, you must provide the ARN of an Amazon SES verified email address for the <code>SourceArn</code> parameter.</p> <p>Before Amazon Cognito can email your users, it requires additional permissions to call Amazon SES on your behalf. When you update your user pool with this option, Amazon Cognito creates a <i>service-linked role</i>, which is a type of IAM role, in your AWS account. This role contains the permissions that allow Amazon Cognito to access Amazon SES and send email messages with your address. For more information about the service-linked role that Amazon Cognito creates, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/using-service-linked-roles.html\\\">Using Service-Linked Roles for Amazon Cognito</a> in the <i>Amazon Cognito Developer Guide</i>.</p> </dd> </dl>\"\
        },\
        \"From\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>Identifies either the senderâs email address or the senderâs name with their email address. For example, <code>testuser@example.com</code> or <code>Test User &lt;testuser@example.com&gt;</code>. This address will appear before the body of the email.</p>\"\
        },\
        \"ConfigurationSet\":{\
          \"shape\":\"SESConfigurationSet\",\
          \"documentation\":\"<p>The set of configuration rules that can be applied to emails sent using Amazon SES. A configuration set is applied to an email by including a reference to the configuration set in the headers of the email. Once applied, all of the rules in that configuration set are applied to the email. Configuration sets can be used to apply the following types of rules to emails: </p> <ul> <li> <p>Event publishing â Amazon SES can track the number of send, delivery, open, click, bounce, and complaint events for each email sent. Use event publishing to send information about these events to other AWS services such as SNS and CloudWatch.</p> </li> <li> <p>IP pool management â When leasing dedicated IP addresses with Amazon SES, you can create groups of IP addresses, called dedicated IP pools. You can then associate the dedicated IP pools with configuration sets.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The email configuration type.</p>\"\
    },\
    \"EmailNotificationBodyType\":{\
      \"type\":\"string\",\
      \"max\":20000,\
      \"min\":6,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]+\"\
    },\
    \"EmailNotificationSubjectType\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s]+\"\
    },\
    \"EmailSendingAccountType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COGNITO_DEFAULT\",\
        \"DEVELOPER\"\
      ]\
    },\
    \"EmailVerificationMessageByLinkType\":{\
      \"type\":\"string\",\
      \"max\":20000,\
      \"min\":6,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]*\\\\{##[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]*##\\\\}[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]*\"\
    },\
    \"EmailVerificationMessageType\":{\
      \"type\":\"string\",\
      \"max\":20000,\
      \"min\":6,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]*\\\\{####\\\\}[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s*]*\"\
    },\
    \"EmailVerificationSubjectByLinkType\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s]+\"\
    },\
    \"EmailVerificationSubjectType\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}\\\\s]+\"\
    },\
    \"EnableSoftwareTokenMFAException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when there is a code mismatch and the service fails to configure the software token TOTP multi-factor authentication (MFA).</p>\",\
      \"exception\":true\
    },\
    \"EventContextDataType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IpAddress\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user's IP address.</p>\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user's device name.</p>\"\
        },\
        \"Timezone\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user's time zone.</p>\"\
        },\
        \"City\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user's city.</p>\"\
        },\
        \"Country\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user's country.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the user context data captured at the time of an event request.</p>\"\
    },\
    \"EventFeedbackType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FeedbackValue\",\
        \"Provider\"\
      ],\
      \"members\":{\
        \"FeedbackValue\":{\
          \"shape\":\"FeedbackValueType\",\
          \"documentation\":\"<p>The event feedback value.</p>\"\
        },\
        \"Provider\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The provider.</p>\"\
        },\
        \"FeedbackDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The event feedback date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the event feedback type.</p>\"\
    },\
    \"EventFilterType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SIGN_IN\",\
        \"PASSWORD_CHANGE\",\
        \"SIGN_UP\"\
      ]\
    },\
    \"EventFiltersType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventFilterType\"}\
    },\
    \"EventIdType\":{\
      \"type\":\"string\",\
      \"max\":50,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+-]+\"\
    },\
    \"EventResponseType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Success\",\
        \"Failure\"\
      ]\
    },\
    \"EventRiskType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RiskDecision\":{\
          \"shape\":\"RiskDecisionType\",\
          \"documentation\":\"<p>The risk decision.</p>\"\
        },\
        \"RiskLevel\":{\
          \"shape\":\"RiskLevelType\",\
          \"documentation\":\"<p>The risk level.</p>\"\
        },\
        \"CompromisedCredentialsDetected\":{\
          \"shape\":\"WrappedBooleanType\",\
          \"documentation\":\"<p>Indicates whether compromised credentials were detected during an authentication event.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The event risk type.</p>\"\
    },\
    \"EventType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SignIn\",\
        \"SignUp\",\
        \"ForgotPassword\"\
      ]\
    },\
    \"ExpiredCodeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the expired code exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown if a code has expired.</p>\",\
      \"exception\":true\
    },\
    \"ExplicitAuthFlowsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExplicitAuthFlowsType\"}\
    },\
    \"ExplicitAuthFlowsType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ADMIN_NO_SRP_AUTH\",\
        \"CUSTOM_AUTH_FLOW_ONLY\",\
        \"USER_PASSWORD_AUTH\",\
        \"ALLOW_ADMIN_USER_PASSWORD_AUTH\",\
        \"ALLOW_CUSTOM_AUTH\",\
        \"ALLOW_USER_PASSWORD_AUTH\",\
        \"ALLOW_USER_SRP_AUTH\",\
        \"ALLOW_REFRESH_TOKEN_AUTH\"\
      ]\
    },\
    \"FeedbackValueType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Valid\",\
        \"Invalid\"\
      ]\
    },\
    \"ForceAliasCreation\":{\"type\":\"boolean\"},\
    \"ForgetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeviceKey\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token for the forgotten device request.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to forget the device.</p>\"\
    },\
    \"ForgotPasswordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"UserContextData\":{\
          \"shape\":\"UserContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user for whom you want to enter a code to reset a forgotten password.</p>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ForgotPassword</code> calls.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the ForgotPassword API action, Amazon Cognito invokes any functions that are assigned to the following triggers: <i>pre sign-up</i>, <i>custom message</i>, and <i>user migration</i>. When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ForgotPassword request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to reset a user's password.</p>\"\
    },\
    \"ForgotPasswordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetails\":{\
          \"shape\":\"CodeDeliveryDetailsType\",\
          \"documentation\":\"<p>The code delivery details returned by the server in response to the request to reset a password.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Respresents the response from the server regarding the request to reset a password.</p>\"\
    },\
    \"GenerateSecret\":{\"type\":\"boolean\"},\
    \"GetCSVHeaderRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are to be imported into.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get the header information for the .csv file for the user import job.</p>\"\
    },\
    \"GetCSVHeaderResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are to be imported into.</p>\"\
        },\
        \"CSVHeader\":{\
          \"shape\":\"ListOfStringTypes\",\
          \"documentation\":\"<p>The header information for the .csv file for the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to get the header information for the .csv file for the user import job.</p>\"\
    },\
    \"GetDeviceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeviceKey\"],\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get the device.</p>\"\
    },\
    \"GetDeviceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Device\"],\
      \"members\":{\
        \"Device\":{\
          \"shape\":\"DeviceType\",\
          \"documentation\":\"<p>The device.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Gets the device response.</p>\"\
    },\
    \"GetGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        }\
      }\
    },\
    \"GetGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Group\":{\
          \"shape\":\"GroupType\",\
          \"documentation\":\"<p>The group object for the group.</p>\"\
        }\
      }\
    },\
    \"GetIdentityProviderByIdentifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"IdpIdentifier\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"IdpIdentifier\":{\
          \"shape\":\"IdpIdentifierType\",\
          \"documentation\":\"<p>The identity provider ID.</p>\"\
        }\
      }\
    },\
    \"GetIdentityProviderByIdentifierResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityProvider\"],\
      \"members\":{\
        \"IdentityProvider\":{\
          \"shape\":\"IdentityProviderType\",\
          \"documentation\":\"<p>The identity provider object.</p>\"\
        }\
      }\
    },\
    \"GetSigningCertificateRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Request to get a signing certificate from Cognito.</p>\"\
    },\
    \"GetSigningCertificateResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Certificate\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The signing certificate.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response from Cognito for a signing certificate request.</p>\"\
    },\
    \"GetUICustomizationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The client ID for the client app.</p>\"\
        }\
      }\
    },\
    \"GetUICustomizationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"UICustomization\"],\
      \"members\":{\
        \"UICustomization\":{\
          \"shape\":\"UICustomizationType\",\
          \"documentation\":\"<p>The UI customization information.</p>\"\
        }\
      }\
    },\
    \"GetUserAttributeVerificationCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"AttributeName\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token returned by the server response to get the user attribute verification code.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The attribute name returned by the server response to get the user attribute verification code.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the GetUserAttributeVerificationCode API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your GetUserAttributeVerificationCode request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get user attribute verification.</p>\"\
    },\
    \"GetUserAttributeVerificationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetails\":{\
          \"shape\":\"CodeDeliveryDetailsType\",\
          \"documentation\":\"<p>The code delivery details returned by the server in response to the request to get the user attribute verification code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The verification code response returned by the server response to get the user attribute verification code.</p>\"\
    },\
    \"GetUserPoolMfaConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        }\
      }\
    },\
    \"GetUserPoolMfaConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SmsMfaConfiguration\":{\
          \"shape\":\"SmsMfaConfigType\",\
          \"documentation\":\"<p>The SMS text message multi-factor (MFA) configuration.</p>\"\
        },\
        \"SoftwareTokenMfaConfiguration\":{\
          \"shape\":\"SoftwareTokenMfaConfigType\",\
          \"documentation\":\"<p>The software token multi-factor (MFA) configuration.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>The multi-factor (MFA) configuration. Valid values include:</p> <ul> <li> <p> <code>OFF</code> MFA will not be used for any users.</p> </li> <li> <p> <code>ON</code> MFA is required for all users to sign in.</p> </li> <li> <p> <code>OPTIONAL</code> MFA will be required only for individual users who have an MFA factor enabled.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"GetUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccessToken\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token returned by the server response to get information about the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to get information about the user.</p>\"\
    },\
    \"GetUserResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Username\",\
        \"UserAttributes\"\
      ],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to retrieve from the get user request.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p> <i>This response parameter is no longer supported.</i> It provides information only about SMS MFA configurations. It doesn't provide information about TOTP software token MFA configurations. To look up information about either type of MFA configuration, use UserMFASettingList instead.</p>\"\
        },\
        \"PreferredMfaSetting\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The user's preferred MFA setting.</p>\"\
        },\
        \"UserMFASettingList\":{\
          \"shape\":\"UserMFASettingListType\",\
          \"documentation\":\"<p>The MFA options that are enabled for the user. The possible values in this list are <code>SMS_MFA</code> and <code>SOFTWARE_TOKEN_MFA</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server from the request to get information about the user.</p>\"\
    },\
    \"GlobalSignOutRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccessToken\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to sign out all devices.</p>\"\
    },\
    \"GlobalSignOutResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response to the request to sign out all devices.</p>\"\
    },\
    \"GroupExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito encounters a group that already exists in the user pool.</p>\",\
      \"exception\":true\
    },\
    \"GroupListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"GroupType\"}\
    },\
    \"GroupNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"GroupType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>A string containing the description of the group.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The role ARN for the group.</p>\"\
        },\
        \"Precedence\":{\
          \"shape\":\"PrecedenceType\",\
          \"documentation\":\"<p>A nonnegative integer value that specifies the precedence of this group relative to the other groups that a user can belong to in the user pool. If a user belongs to two or more groups, it is the group with the highest precedence whose role ARN will be used in the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims in the user's tokens. Groups with higher <code>Precedence</code> values take precedence over groups with lower <code>Precedence</code> values or with null <code>Precedence</code> values.</p> <p>Two groups can have the same <code>Precedence</code> value. If this happens, neither group takes precedence over the other. If two groups with the same <code>Precedence</code> have the same role ARN, that role is used in the <code>cognito:preferred_role</code> claim in tokens for users in each group. If the two groups have different role ARNs, the <code>cognito:preferred_role</code> claim is not set in users' tokens.</p> <p>The default <code>Precedence</code> value is null.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the group was last modified.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the group was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The group type.</p>\"\
    },\
    \"HexStringType\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[0-9a-fA-F]+$\"\
    },\
    \"HttpHeader\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"headerName\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The header name</p>\"\
        },\
        \"headerValue\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The header value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The HTTP header.</p>\"\
    },\
    \"HttpHeaderList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HttpHeader\"}\
    },\
    \"IdTokenValidityType\":{\
      \"type\":\"integer\",\
      \"max\":86400,\
      \"min\":1\
    },\
    \"IdentityProviderType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"ProviderName\":{\
          \"shape\":\"ProviderNameType\",\
          \"documentation\":\"<p>The identity provider name.</p>\"\
        },\
        \"ProviderType\":{\
          \"shape\":\"IdentityProviderTypeType\",\
          \"documentation\":\"<p>The identity provider type.</p>\"\
        },\
        \"ProviderDetails\":{\
          \"shape\":\"ProviderDetailsType\",\
          \"documentation\":\"<p>The identity provider details. The following list describes the provider detail keys for each identity provider type.</p> <ul> <li> <p>For Google and Login with Amazon:</p> <ul> <li> <p>client_id</p> </li> <li> <p>client_secret</p> </li> <li> <p>authorize_scopes</p> </li> </ul> </li> <li> <p>For Facebook:</p> <ul> <li> <p>client_id</p> </li> <li> <p>client_secret</p> </li> <li> <p>authorize_scopes</p> </li> <li> <p>api_version</p> </li> </ul> </li> <li> <p>For Sign in with Apple:</p> <ul> <li> <p>client_id</p> </li> <li> <p>team_id</p> </li> <li> <p>key_id</p> </li> <li> <p>private_key</p> </li> <li> <p>authorize_scopes</p> </li> </ul> </li> <li> <p>For OIDC providers:</p> <ul> <li> <p>client_id</p> </li> <li> <p>client_secret</p> </li> <li> <p>attributes_request_method</p> </li> <li> <p>oidc_issuer</p> </li> <li> <p>authorize_scopes</p> </li> <li> <p>authorize_url <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> <li> <p>token_url <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> <li> <p>attributes_url <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> <li> <p>jwks_uri <i>if not available from discovery URL specified by oidc_issuer key</i> </p> </li> <li> <p>authorize_scopes</p> </li> </ul> </li> <li> <p>For SAML providers:</p> <ul> <li> <p>MetadataFile OR MetadataURL</p> </li> <li> <p>IDPSignOut <i>optional</i> </p> </li> </ul> </li> </ul>\"\
        },\
        \"AttributeMapping\":{\
          \"shape\":\"AttributeMappingType\",\
          \"documentation\":\"<p>A mapping of identity provider attributes to standard and custom user pool attributes.</p>\"\
        },\
        \"IdpIdentifiers\":{\
          \"shape\":\"IdpIdentifiersListType\",\
          \"documentation\":\"<p>A list of identity provider identifiers.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the identity provider was last modified.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the identity provider was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container for information about an identity provider.</p>\"\
    },\
    \"IdentityProviderTypeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SAML\",\
        \"Facebook\",\
        \"Google\",\
        \"LoginWithAmazon\",\
        \"SignInWithApple\",\
        \"OIDC\"\
      ]\
    },\
    \"IdpIdentifierType\":{\
      \"type\":\"string\",\
      \"max\":40,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\s+=.@-]+\"\
    },\
    \"IdpIdentifiersListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IdpIdentifierType\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"ImageFileType\":{\"type\":\"blob\"},\
    \"ImageUrlType\":{\"type\":\"string\"},\
    \"InitiateAuthRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AuthFlow\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"AuthFlow\":{\
          \"shape\":\"AuthFlowType\",\
          \"documentation\":\"<p>The authentication flow for this call to execute. The API action will depend on this value. For example: </p> <ul> <li> <p> <code>REFRESH_TOKEN_AUTH</code> will take in a valid refresh token and return new tokens.</p> </li> <li> <p> <code>USER_SRP_AUTH</code> will take in <code>USERNAME</code> and <code>SRP_A</code> and return the SRP variables to be used for next challenge execution.</p> </li> <li> <p> <code>USER_PASSWORD_AUTH</code> will take in <code>USERNAME</code> and <code>PASSWORD</code> and return the next challenge or tokens.</p> </li> </ul> <p>Valid values include:</p> <ul> <li> <p> <code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote Password (SRP) protocol.</p> </li> <li> <p> <code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication flow for refreshing the access token and ID token by supplying a valid refresh token.</p> </li> <li> <p> <code>CUSTOM_AUTH</code>: Custom authentication flow.</p> </li> <li> <p> <code>USER_PASSWORD_AUTH</code>: Non-SRP authentication flow; USERNAME and PASSWORD are passed directly. If a user migration Lambda trigger is set, this flow will invoke the user migration Lambda if the USERNAME is not found in the user pool. </p> </li> <li> <p> <code>ADMIN_USER_PASSWORD_AUTH</code>: Admin-based user password authentication. This replaces the <code>ADMIN_NO_SRP_AUTH</code> authentication flow. In this flow, Cognito receives the password in the request instead of using the SRP process to verify passwords.</p> </li> </ul> <p> <code>ADMIN_NO_SRP_AUTH</code> is not a valid value.</p>\"\
        },\
        \"AuthParameters\":{\
          \"shape\":\"AuthParametersType\",\
          \"documentation\":\"<p>The authentication parameters. These are inputs corresponding to the <code>AuthFlow</code> that you are invoking. The required values depend on the value of <code>AuthFlow</code>:</p> <ul> <li> <p>For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required), <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p> </li> <li> <p>For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>: <code>REFRESH_TOKEN</code> (required), <code>SECRET_HASH</code> (required if the app client is configured with a client secret), <code>DEVICE_KEY</code>.</p> </li> <li> <p>For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required), <code>SECRET_HASH</code> (if app client is configured with client secret), <code>DEVICE_KEY</code>. To start the authentication flow with password verification, include <code>ChallengeName: SRP_A</code> and <code>SRP_A: (The SRP_A Value)</code>.</p> </li> </ul>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for certain custom workflows that this action triggers.</p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the InitiateAuth API action, Amazon Cognito invokes the AWS Lambda functions that are specified for various triggers. The ClientMetadata value is passed as input to the functions for only the following triggers:</p> <ul> <li> <p>Pre signup</p> </li> <li> <p>Pre authentication</p> </li> <li> <p>User migration</p> </li> </ul> <p>When Amazon Cognito invokes the functions for these triggers, it passes a JSON payload, which the function receives as input. This payload contains a <code>validationData</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your InitiateAuth request. In your function code in AWS Lambda, you can process the <code>validationData</code> value to enhance your workflow for your specific needs.</p> <p>When you use the InitiateAuth API action, Amazon Cognito also invokes the functions for the following triggers, but it does not provide the ClientMetadata value as input:</p> <ul> <li> <p>Post authentication</p> </li> <li> <p>Custom message</p> </li> <li> <p>Pre token generation</p> </li> <li> <p>Create auth challenge</p> </li> <li> <p>Define auth challenge</p> </li> <li> <p>Verify auth challenge</p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID.</p>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>InitiateAuth</code> calls.</p>\"\
        },\
        \"UserContextData\":{\
          \"shape\":\"UserContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Initiates the authentication request.</p>\"\
    },\
    \"InitiateAuthResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The name of the challenge which you are responding to with this call. This is returned to you in the <code>AdminInitiateAuth</code> response if you need to pass another challenge.</p> <p>Valid values include the following. Note that all of these challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable) in the parameters.</p> <ul> <li> <p> <code>SMS_MFA</code>: Next challenge is to supply an <code>SMS_MFA_CODE</code>, delivered via SMS.</p> </li> <li> <p> <code>PASSWORD_VERIFIER</code>: Next challenge is to supply <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after the client-side SRP calculations.</p> </li> <li> <p> <code>CUSTOM_CHALLENGE</code>: This is returned if your custom authentication flow determines that the user should pass another challenge before tokens are issued.</p> </li> <li> <p> <code>DEVICE_SRP_AUTH</code>: If device tracking was enabled on your user pool and the previous challenges were passed, this challenge is returned so that Amazon Cognito can start tracking this device.</p> </li> <li> <p> <code>DEVICE_PASSWORD_VERIFIER</code>: Similar to <code>PASSWORD_VERIFIER</code>, but for devices only.</p> </li> <li> <p> <code>NEW_PASSWORD_REQUIRED</code>: For users which are required to change their passwords after successful first login. This challenge should be passed with <code>NEW_PASSWORD</code> and any other required attributes.</p> </li> </ul>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. If the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters. These are returned to you in the <code>InitiateAuth</code> response if you need to pass another challenge. The responses in this parameter should be used to compute inputs to the next call (<code>RespondToAuthChallenge</code>). </p> <p>All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable).</p>\"\
        },\
        \"AuthenticationResult\":{\
          \"shape\":\"AuthenticationResultType\",\
          \"documentation\":\"<p>The result of the authentication response. This is only returned if the caller does not need to pass another challenge. If the caller does need to pass another challenge before it gets tokens, <code>ChallengeName</code>, <code>ChallengeParameters</code>, and <code>Session</code> are returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Initiates the authentication response.</p>\"\
    },\
    \"IntegerType\":{\"type\":\"integer\"},\
    \"InternalErrorException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws an internal error exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito encounters an internal error.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidEmailRoleAccessPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when you have an unverified email address or the identity policy is not set on an email address that Amazon Cognito can access.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito is not allowed to use your email identity. HTTP status code: 400.</p>\",\
      \"exception\":true\
    },\
    \"InvalidLambdaResponseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service throws an invalid AWS Lambda response exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters an invalid AWS Lambda response.</p>\",\
      \"exception\":true\
    },\
    \"InvalidOAuthFlowException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when the specified OAuth flow is invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service throws an invalid parameter exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters an invalid parameter.</p>\",\
      \"exception\":true\
    },\
    \"InvalidPasswordException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service throws an invalid user password exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters an invalid password.</p>\",\
      \"exception\":true\
    },\
    \"InvalidSmsRoleAccessPolicyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message retuned when the invalid SMS role access policy exception is thrown.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is returned when the role provided for SMS configuration does not have permission to publish using Amazon SNS.</p>\",\
      \"exception\":true\
    },\
    \"InvalidSmsRoleTrustRelationshipException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the role trust relationship for the SMS message is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the trust relationship is invalid for the role provided for SMS configuration. This can happen if you do not trust <b>cognito-idp.amazonaws.com</b> or the external ID provided in the role does not match what is provided in the SMS configuration for the user pool.</p>\",\
      \"exception\":true\
    },\
    \"InvalidUserPoolConfigurationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the user pool configuration is invalid.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the user pool configuration is invalid.</p>\",\
      \"exception\":true\
    },\
    \"LambdaConfigType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PreSignUp\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A pre-registration AWS Lambda trigger.</p>\"\
        },\
        \"CustomMessage\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A custom Message AWS Lambda trigger.</p>\"\
        },\
        \"PostConfirmation\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A post-confirmation AWS Lambda trigger.</p>\"\
        },\
        \"PreAuthentication\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A pre-authentication AWS Lambda trigger.</p>\"\
        },\
        \"PostAuthentication\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A post-authentication AWS Lambda trigger.</p>\"\
        },\
        \"DefineAuthChallenge\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>Defines the authentication challenge.</p>\"\
        },\
        \"CreateAuthChallenge\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>Creates an authentication challenge.</p>\"\
        },\
        \"VerifyAuthChallengeResponse\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>Verifies the authentication challenge response.</p>\"\
        },\
        \"PreTokenGeneration\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>A Lambda trigger that is invoked before token generation.</p>\"\
        },\
        \"UserMigration\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The user migration Lambda config type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the configuration for AWS Lambda triggers.</p>\"\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws a limit exceeded exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user exceeds the limit for a requested AWS resource.</p>\",\
      \"exception\":true\
    },\
    \"ListDevicesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccessToken\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access tokens for the request to list devices.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the device request.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token for the list request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list the devices.</p>\"\
    },\
    \"ListDevicesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Devices\":{\
          \"shape\":\"DeviceListType\",\
          \"documentation\":\"<p>The devices returned in the list devices response.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>The pagination token for the list device response.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response to list devices.</p>\"\
    },\
    \"ListGroupsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the request to list groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      }\
    },\
    \"ListGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Groups\":{\
          \"shape\":\"GroupListType\",\
          \"documentation\":\"<p>The group objects for the groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      }\
    },\
    \"ListIdentityProvidersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListProvidersLimitType\",\
          \"documentation\":\"<p>The maximum number of identity providers to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>A pagination token.</p>\"\
        }\
      }\
    },\
    \"ListIdentityProvidersResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Providers\"],\
      \"members\":{\
        \"Providers\":{\
          \"shape\":\"ProvidersListType\",\
          \"documentation\":\"<p>A list of identity provider objects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>A pagination token.</p>\"\
        }\
      }\
    },\
    \"ListOfStringTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StringType\"}\
    },\
    \"ListProvidersLimitType\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":0\
    },\
    \"ListResourceServersLimitType\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"ListResourceServersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListResourceServersLimitType\",\
          \"documentation\":\"<p>The maximum number of resource servers to return.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>A pagination token.</p>\"\
        }\
      }\
    },\
    \"ListResourceServersResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceServers\"],\
      \"members\":{\
        \"ResourceServers\":{\
          \"shape\":\"ResourceServersListType\",\
          \"documentation\":\"<p>The resource servers.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>A pagination token.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"UserPoolTagsType\",\
          \"documentation\":\"<p>The tags that are assigned to the user pool.</p>\"\
        }\
      }\
    },\
    \"ListUserImportJobsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"MaxResults\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are being imported into.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PoolQueryLimitType\",\
          \"documentation\":\"<p>The maximum number of import jobs you want the request to return.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to <code>ListUserImportJobs</code>, which can be used to return the next set of import jobs in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list the user import jobs.</p>\"\
    },\
    \"ListUserImportJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserImportJobs\":{\
          \"shape\":\"UserImportJobsListType\",\
          \"documentation\":\"<p>The user import jobs.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>An identifier that can be used to return the next set of user import jobs in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to list the user import jobs.</p>\"\
    },\
    \"ListUserPoolClientsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to list user pool clients.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"QueryLimit\",\
          \"documentation\":\"<p>The maximum number of results you want the request to return when listing the user pool clients.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list the user pool clients.</p>\"\
    },\
    \"ListUserPoolClientsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClients\":{\
          \"shape\":\"UserPoolClientListType\",\
          \"documentation\":\"<p>The user pool clients in the response that lists user pool clients.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server that lists user pool clients.</p>\"\
    },\
    \"ListUserPoolsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MaxResults\"],\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PoolQueryLimitType\",\
          \"documentation\":\"<p>The maximum number of results you want the request to return when listing the user pools.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list user pools.</p>\"\
    },\
    \"ListUserPoolsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPools\":{\
          \"shape\":\"UserPoolListType\",\
          \"documentation\":\"<p>The user pools from the response to list users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKeyType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response to list user pools.</p>\"\
    },\
    \"ListUsersInGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"GroupName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>The limit of the request to list users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      }\
    },\
    \"ListUsersInGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Users\":{\
          \"shape\":\"UsersListType\",\
          \"documentation\":\"<p>The users returned in the request to list users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationKey\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      }\
    },\
    \"ListUsersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool on which the search should be performed.</p>\"\
        },\
        \"AttributesToGet\":{\
          \"shape\":\"SearchedAttributeNamesListType\",\
          \"documentation\":\"<p>An array of strings, where each string is the name of a user attribute to be returned for each user in the search results. If the array is null, all attributes are returned.</p>\"\
        },\
        \"Limit\":{\
          \"shape\":\"QueryLimitType\",\
          \"documentation\":\"<p>Maximum number of users to be returned.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        },\
        \"Filter\":{\
          \"shape\":\"UserFilterType\",\
          \"documentation\":\"<p>A filter string of the form \\\"<i>AttributeName</i> <i>Filter-Type</i> \\\"<i>AttributeValue</i>\\\"\\\". Quotation marks within the filter string must be escaped using the backslash (\\\\) character. For example, \\\"<code>family_name</code> = \\\\\\\"Reddy\\\\\\\"\\\".</p> <ul> <li> <p> <i>AttributeName</i>: The name of the attribute to search for. You can only search for one attribute at a time.</p> </li> <li> <p> <i>Filter-Type</i>: For an exact match, use =, for example, \\\"<code>given_name</code> = \\\\\\\"Jon\\\\\\\"\\\". For a prefix (\\\"starts with\\\") match, use ^=, for example, \\\"<code>given_name</code> ^= \\\\\\\"Jon\\\\\\\"\\\". </p> </li> <li> <p> <i>AttributeValue</i>: The attribute value that must be matched for each user.</p> </li> </ul> <p>If the filter string is empty, <code>ListUsers</code> returns all users in the user pool.</p> <p>You can only search for the following standard attributes:</p> <ul> <li> <p> <code>username</code> (case-sensitive)</p> </li> <li> <p> <code>email</code> </p> </li> <li> <p> <code>phone_number</code> </p> </li> <li> <p> <code>name</code> </p> </li> <li> <p> <code>given_name</code> </p> </li> <li> <p> <code>family_name</code> </p> </li> <li> <p> <code>preferred_username</code> </p> </li> <li> <p> <code>cognito:user_status</code> (called <b>Status</b> in the Console) (case-insensitive)</p> </li> <li> <p> <code>status (called <b>Enabled</b> in the Console) (case-sensitive)</code> </p> </li> <li> <p> <code>sub</code> </p> </li> </ul> <p>Custom attributes are not searchable.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-using-listusers-api\\\">Searching for Users Using the ListUsers API</a> and <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-listusers-api-examples\\\">Examples of Using the ListUsers API</a> in the <i>Amazon Cognito Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to list users.</p>\"\
    },\
    \"ListUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Users\":{\
          \"shape\":\"UsersListType\",\
          \"documentation\":\"<p>The users returned in the request to list users.</p>\"\
        },\
        \"PaginationToken\":{\
          \"shape\":\"SearchPaginationTokenType\",\
          \"documentation\":\"<p>An identifier that was returned from the previous call to this operation, which can be used to return the next set of items in the list.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the request to list users.</p>\"\
    },\
    \"LogoutURLsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RedirectUrlType\"},\
      \"max\":100,\
      \"min\":0\
    },\
    \"LongType\":{\"type\":\"long\"},\
    \"MFAMethodNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws an MFA method not found exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito cannot find a multi-factor authentication (MFA) method.</p>\",\
      \"exception\":true\
    },\
    \"MFAOptionListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MFAOptionType\"}\
    },\
    \"MFAOptionType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeliveryMedium\":{\
          \"shape\":\"DeliveryMediumType\",\
          \"documentation\":\"<p>The delivery medium to send the MFA code. You can use this parameter to set only the <code>SMS</code> delivery medium value.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The attribute name of the MFA option type. The only valid value is <code>phone_number</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p> <i>This data type is no longer supported.</i> You can use it only for SMS MFA configurations. You can't use it for TOTP software token MFA configurations.</p>\"\
    },\
    \"MessageActionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RESEND\",\
        \"SUPPRESS\"\
      ]\
    },\
    \"MessageTemplateType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SMSMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The message template for SMS messages.</p>\"\
        },\
        \"EmailMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>The message template for email messages.</p>\"\
        },\
        \"EmailSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>The subject line for email messages.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The message template structure.</p>\"\
    },\
    \"MessageType\":{\"type\":\"string\"},\
    \"NewDeviceMetadataType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceGroupKey\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The device group key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The new device metadata type.</p>\"\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a not authorized exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user is not authorized.</p>\",\
      \"exception\":true\
    },\
    \"NotifyConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\"SourceArn\"],\
      \"members\":{\
        \"From\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The email address that is sending the email. It must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES.</p>\"\
        },\
        \"ReplyTo\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The destination to which the receiver of an email should reply to.</p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the identity that is associated with the sending authorization policy. It permits Amazon Cognito to send for the email address specified in the <code>From</code> parameter.</p>\"\
        },\
        \"BlockEmail\":{\
          \"shape\":\"NotifyEmailType\",\
          \"documentation\":\"<p>Email template used when a detected risk event is blocked.</p>\"\
        },\
        \"NoActionEmail\":{\
          \"shape\":\"NotifyEmailType\",\
          \"documentation\":\"<p>The email template used when a detected risk event is allowed.</p>\"\
        },\
        \"MfaEmail\":{\
          \"shape\":\"NotifyEmailType\",\
          \"documentation\":\"<p>The MFA email template used when MFA is challenged as part of a detected risk.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The notify configuration type.</p>\"\
    },\
    \"NotifyEmailType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Subject\"],\
      \"members\":{\
        \"Subject\":{\
          \"shape\":\"EmailNotificationSubjectType\",\
          \"documentation\":\"<p>The subject.</p>\"\
        },\
        \"HtmlBody\":{\
          \"shape\":\"EmailNotificationBodyType\",\
          \"documentation\":\"<p>The HTML body.</p>\"\
        },\
        \"TextBody\":{\
          \"shape\":\"EmailNotificationBodyType\",\
          \"documentation\":\"<p>The text body.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The notify email type.</p>\"\
    },\
    \"NumberAttributeConstraintsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinValue\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The minimum value of an attribute that is of the number data type.</p>\"\
        },\
        \"MaxValue\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The maximum value of an attribute that is of the number data type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The minimum and maximum value of an attribute that is of the number data type.</p>\"\
    },\
    \"OAuthFlowType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"code\",\
        \"implicit\",\
        \"client_credentials\"\
      ]\
    },\
    \"OAuthFlowsType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OAuthFlowType\"},\
      \"max\":3,\
      \"min\":0\
    },\
    \"PaginationKey\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"PaginationKeyType\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"PasswordPolicyMinLengthType\":{\
      \"type\":\"integer\",\
      \"max\":99,\
      \"min\":6\
    },\
    \"PasswordPolicyType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinimumLength\":{\
          \"shape\":\"PasswordPolicyMinLengthType\",\
          \"documentation\":\"<p>The minimum length of the password policy that you have set. Cannot be less than 6.</p>\"\
        },\
        \"RequireUppercase\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one uppercase letter in their password.</p>\"\
        },\
        \"RequireLowercase\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one lowercase letter in their password.</p>\"\
        },\
        \"RequireNumbers\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one number in their password.</p>\"\
        },\
        \"RequireSymbols\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>In the password policy that you have set, refers to whether you have required users to use at least one symbol in their password.</p>\"\
        },\
        \"TemporaryPasswordValidityDays\":{\
          \"shape\":\"TemporaryPasswordValidityDaysType\",\
          \"documentation\":\"<p>In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by an administrator.</p> <note> <p>When you set <code>TemporaryPasswordValidityDays</code> for a user pool, you will no longer be able to set the deprecated <code>UnusedAccountValidityDays</code> value for that user pool.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The password policy type.</p>\"\
    },\
    \"PasswordResetRequiredException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when a password reset is required.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a password reset is required.</p>\",\
      \"exception\":true\
    },\
    \"PasswordType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":6,\
      \"pattern\":\"[\\\\S]+\",\
      \"sensitive\":true\
    },\
    \"PoolQueryLimitType\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":1\
    },\
    \"PreSignedUrlType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0\
    },\
    \"PrecedenceType\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"PreconditionNotMetException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when a precondition is not met.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a precondition is not met.</p>\",\
      \"exception\":true\
    },\
    \"PreventUserExistenceErrorTypes\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LEGACY\",\
        \"ENABLED\"\
      ]\
    },\
    \"PriorityType\":{\
      \"type\":\"integer\",\
      \"max\":2,\
      \"min\":1\
    },\
    \"ProviderDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProviderName\":{\
          \"shape\":\"ProviderNameType\",\
          \"documentation\":\"<p>The identity provider name.</p>\"\
        },\
        \"ProviderType\":{\
          \"shape\":\"IdentityProviderTypeType\",\
          \"documentation\":\"<p>The identity provider type.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the provider was last modified.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the provider was added to the user pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container for identity provider details.</p>\"\
    },\
    \"ProviderDetailsType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"StringType\"},\
      \"value\":{\"shape\":\"StringType\"}\
    },\
    \"ProviderNameType\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"ProviderNameTypeV1\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[^_][\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}][^_]+\"\
    },\
    \"ProviderUserIdentifierType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProviderName\":{\
          \"shape\":\"ProviderNameType\",\
          \"documentation\":\"<p>The name of the provider, for example, Facebook, Google, or Login with Amazon.</p>\"\
        },\
        \"ProviderAttributeName\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The name of the provider attribute to link to, for example, <code>NameID</code>.</p>\"\
        },\
        \"ProviderAttributeValue\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The value of the provider attribute to link to, for example, <code>xxxxx_account</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container for information about an identity provider for a user pool.</p>\"\
    },\
    \"ProvidersListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProviderDescription\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"QueryLimit\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":1\
    },\
    \"QueryLimitType\":{\
      \"type\":\"integer\",\
      \"max\":60,\
      \"min\":0\
    },\
    \"RecoveryMechanismsType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RecoveryOptionType\"},\
      \"max\":2,\
      \"min\":1\
    },\
    \"RecoveryOptionNameType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"verified_email\",\
        \"verified_phone_number\",\
        \"admin_only\"\
      ]\
    },\
    \"RecoveryOptionType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Priority\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"Priority\":{\
          \"shape\":\"PriorityType\",\
          \"documentation\":\"<p>A positive integer specifying priority of a method with 1 being the highest priority.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"RecoveryOptionNameType\",\
          \"documentation\":\"<p>Specifies the recovery method for a user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A map containing a priority as a key, and recovery method name as a value.</p>\"\
    },\
    \"RedirectUrlType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\"\
    },\
    \"RefreshTokenValidityType\":{\
      \"type\":\"integer\",\
      \"max\":315360000,\
      \"min\":0\
    },\
    \"ResendConfirmationCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"UserContextData\":{\
          \"shape\":\"UserContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user to whom you wish to resend a confirmation code.</p>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>ResendConfirmationCode</code> calls.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the ResendConfirmationCode API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your ResendConfirmationCode request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to resend the confirmation code.</p>\"\
    },\
    \"ResendConfirmationCodeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetails\":{\
          \"shape\":\"CodeDeliveryDetailsType\",\
          \"documentation\":\"<p>The code delivery details returned by the server in response to the request to resend the confirmation code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the server when the Amazon Cognito Your User Pools service makes the request to resend a confirmation code.</p>\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a resource not found exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service cannot find the requested resource.</p>\",\
      \"exception\":true\
    },\
    \"ResourceServerIdentifierType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\x21\\\\x23-\\\\x5B\\\\x5D-\\\\x7E]+\"\
    },\
    \"ResourceServerNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\s+=,.@-]+\"\
    },\
    \"ResourceServerScopeDescriptionType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ResourceServerScopeListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceServerScopeType\"},\
      \"max\":100\
    },\
    \"ResourceServerScopeNameType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\x21\\\\x23-\\\\x2E\\\\x30-\\\\x5B\\\\x5D-\\\\x7E]+\"\
    },\
    \"ResourceServerScopeType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ScopeName\",\
        \"ScopeDescription\"\
      ],\
      \"members\":{\
        \"ScopeName\":{\
          \"shape\":\"ResourceServerScopeNameType\",\
          \"documentation\":\"<p>The name of the scope.</p>\"\
        },\
        \"ScopeDescription\":{\
          \"shape\":\"ResourceServerScopeDescriptionType\",\
          \"documentation\":\"<p>A description of the scope.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A resource server scope.</p>\"\
    },\
    \"ResourceServerType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that hosts the resource server.</p>\"\
        },\
        \"Identifier\":{\
          \"shape\":\"ResourceServerIdentifierType\",\
          \"documentation\":\"<p>The identifier for the resource server.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceServerNameType\",\
          \"documentation\":\"<p>The name of the resource server.</p>\"\
        },\
        \"Scopes\":{\
          \"shape\":\"ResourceServerScopeListType\",\
          \"documentation\":\"<p>A list of scopes that are defined for the resource server.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container for information about a resource server for a user pool.</p>\"\
    },\
    \"ResourceServersListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceServerType\"}\
    },\
    \"RespondToAuthChallengeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"ChallengeName\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID.</p>\"\
        },\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The challenge name. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html\\\">InitiateAuth</a>.</p> <p> <code>ADMIN_NO_SRP_AUTH</code> is not a valid value.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. If <code>InitiateAuth</code> or <code>RespondToAuthChallenge</code> API call determines that the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>\"\
        },\
        \"ChallengeResponses\":{\
          \"shape\":\"ChallengeResponsesType\",\
          \"documentation\":\"<p>The challenge responses. These are inputs corresponding to the value of <code>ChallengeName</code>, for example:</p> <note> <p> <code>SECRET_HASH</code> (if app client is configured with client secret) applies to all inputs below (including <code>SOFTWARE_TOKEN_MFA</code>).</p> </note> <ul> <li> <p> <code>SMS_MFA</code>: <code>SMS_MFA_CODE</code>, <code>USERNAME</code>.</p> </li> <li> <p> <code>PASSWORD_VERIFIER</code>: <code>PASSWORD_CLAIM_SIGNATURE</code>, <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, <code>TIMESTAMP</code>, <code>USERNAME</code>.</p> </li> <li> <p> <code>NEW_PASSWORD_REQUIRED</code>: <code>NEW_PASSWORD</code>, any other required attributes, <code>USERNAME</code>. </p> </li> <li> <p> <code>SOFTWARE_TOKEN_MFA</code>: <code>USERNAME</code> and <code>SOFTWARE_TOKEN_MFA_CODE</code> are required attributes.</p> </li> <li> <p> <code>DEVICE_SRP_AUTH</code> requires <code>USERNAME</code>, <code>DEVICE_KEY</code>, <code>SRP_A</code> (and <code>SECRET_HASH</code>).</p> </li> <li> <p> <code>DEVICE_PASSWORD_VERIFIER</code> requires everything that <code>PASSWORD_VERIFIER</code> requires plus <code>DEVICE_KEY</code>.</p> </li> </ul>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>RespondToAuthChallenge</code> calls.</p>\"\
        },\
        \"UserContextData\":{\
          \"shape\":\"UserContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the RespondToAuthChallenge API action, Amazon Cognito invokes any functions that are assigned to the following triggers: <i>post authentication</i>, <i>pre token generation</i>, <i>define auth challenge</i>, <i>create auth challenge</i>, and <i>verify auth challenge</i>. When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your RespondToAuthChallenge request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The request to respond to an authentication challenge.</p>\"\
    },\
    \"RespondToAuthChallengeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChallengeName\":{\
          \"shape\":\"ChallengeNameType\",\
          \"documentation\":\"<p>The challenge name. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html\\\">InitiateAuth</a>.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service. If the caller needs to go through another challenge, they return a session with other challenge parameters. This session should be passed as it is to the next <code>RespondToAuthChallenge</code> API call.</p>\"\
        },\
        \"ChallengeParameters\":{\
          \"shape\":\"ChallengeParametersType\",\
          \"documentation\":\"<p>The challenge parameters. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html\\\">InitiateAuth</a>.</p>\"\
        },\
        \"AuthenticationResult\":{\
          \"shape\":\"AuthenticationResultType\",\
          \"documentation\":\"<p>The result returned by the server in response to the request to respond to the authentication challenge.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response to respond to the authentication challenge.</p>\"\
    },\
    \"RiskConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID.</p>\"\
        },\
        \"CompromisedCredentialsRiskConfiguration\":{\
          \"shape\":\"CompromisedCredentialsRiskConfigurationType\",\
          \"documentation\":\"<p>The compromised credentials risk configuration object including the <code>EventFilter</code> and the <code>EventAction</code> </p>\"\
        },\
        \"AccountTakeoverRiskConfiguration\":{\
          \"shape\":\"AccountTakeoverRiskConfigurationType\",\
          \"documentation\":\"<p>The account takeover risk configuration object including the <code>NotifyConfiguration</code> object and <code>Actions</code> to take in the case of an account takeover.</p>\"\
        },\
        \"RiskExceptionConfiguration\":{\
          \"shape\":\"RiskExceptionConfigurationType\",\
          \"documentation\":\"<p>The configuration to override the risk decision.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The risk configuration type.</p>\"\
    },\
    \"RiskDecisionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NoRisk\",\
        \"AccountTakeover\",\
        \"Block\"\
      ]\
    },\
    \"RiskExceptionConfigurationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BlockedIPRangeList\":{\
          \"shape\":\"BlockedIPRangeListType\",\
          \"documentation\":\"<p>Overrides the risk decision to always block the pre-authentication requests. The IP range is in CIDR notation: a compact representation of an IP address and its associated routing prefix.</p>\"\
        },\
        \"SkippedIPRangeList\":{\
          \"shape\":\"SkippedIPRangeListType\",\
          \"documentation\":\"<p>Risk detection is not performed on the IP addresses in the range list. The IP range is in CIDR notation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type of the configuration to override the risk decision.</p>\"\
    },\
    \"RiskLevelType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Low\",\
        \"Medium\",\
        \"High\"\
      ]\
    },\
    \"S3BucketType\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":3,\
      \"pattern\":\"^[0-9A-Za-z\\\\.\\\\-_]*(?<!\\\\.)$\"\
    },\
    \"SESConfigurationSet\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9_-]+$\"\
    },\
    \"SMSMfaSettingsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether SMS text message MFA is enabled.</p>\"\
        },\
        \"PreferredMfa\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether SMS is the preferred MFA method.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type used for enabling SMS MFA at the user level.</p>\"\
    },\
    \"SchemaAttributeType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CustomAttributeNameType\",\
          \"documentation\":\"<p>A schema attribute of the name type.</p>\"\
        },\
        \"AttributeDataType\":{\
          \"shape\":\"AttributeDataType\",\
          \"documentation\":\"<p>The attribute data type.</p>\"\
        },\
        \"DeveloperOnlyAttribute\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<note> <p>We recommend that you use <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UserPoolClientType.html#CognitoUserPools-Type-UserPoolClientType-WriteAttributes\\\">WriteAttributes</a> in the user pool client to control how attributes can be mutated for new use cases instead of using <code>DeveloperOnlyAttribute</code>.</p> </note> <p>Specifies whether the attribute type is developer only. This attribute can only be modified by an administrator. Users will not be able to modify this attribute using their access token. For example, <code>DeveloperOnlyAttribute</code> can be modified using AdminUpdateUserAttributes but cannot be updated using UpdateUserAttributes.</p>\",\
          \"box\":true\
        },\
        \"Mutable\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether the value of the attribute can be changed.</p> <p>For any user pool attribute that's mapped to an identity provider attribute, you must set this parameter to <code>true</code>. Amazon Cognito updates mapped attributes when users sign in to your application through an identity provider. If an attribute is immutable, Amazon Cognito throws an error when it attempts to update the attribute. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html\\\">Specifying Identity Provider Attribute Mappings for Your User Pool</a>.</p>\",\
          \"box\":true\
        },\
        \"Required\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether a user pool attribute is required. If the attribute is required and the user does not provide a value, registration or sign-in will fail.</p>\",\
          \"box\":true\
        },\
        \"NumberAttributeConstraints\":{\
          \"shape\":\"NumberAttributeConstraintsType\",\
          \"documentation\":\"<p>Specifies the constraints for an attribute of the number type.</p>\"\
        },\
        \"StringAttributeConstraints\":{\
          \"shape\":\"StringAttributeConstraintsType\",\
          \"documentation\":\"<p>Specifies the constraints for an attribute of the string type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the schema attribute.</p>\"\
    },\
    \"SchemaAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SchemaAttributeType\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"ScopeDoesNotExistException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when the specified scope does not exist.</p>\",\
      \"exception\":true\
    },\
    \"ScopeListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScopeType\"},\
      \"max\":50\
    },\
    \"ScopeType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\x21\\\\x23-\\\\x5B\\\\x5D-\\\\x7E]+\"\
    },\
    \"SearchPaginationTokenType\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\S]+\"\
    },\
    \"SearchedAttributeNamesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeNameType\"}\
    },\
    \"SecretCodeType\":{\
      \"type\":\"string\",\
      \"min\":16,\
      \"pattern\":\"[A-Za-z0-9]+\",\
      \"sensitive\":true\
    },\
    \"SecretHashType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+=/]+\",\
      \"sensitive\":true\
    },\
    \"SessionType\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"SetRiskConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID. </p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The app client ID. If <code>ClientId</code> is null, then the risk configuration is mapped to <code>userPoolId</code>. When the client ID is null, the same risk configuration is applied to all the clients in the userPool.</p> <p>Otherwise, <code>ClientId</code> is mapped to the client. When the client ID is not null, the user pool configuration is overridden and the risk configuration for the client is used instead.</p>\"\
        },\
        \"CompromisedCredentialsRiskConfiguration\":{\
          \"shape\":\"CompromisedCredentialsRiskConfigurationType\",\
          \"documentation\":\"<p>The compromised credentials risk configuration.</p>\"\
        },\
        \"AccountTakeoverRiskConfiguration\":{\
          \"shape\":\"AccountTakeoverRiskConfigurationType\",\
          \"documentation\":\"<p>The account takeover risk configuration.</p>\"\
        },\
        \"RiskExceptionConfiguration\":{\
          \"shape\":\"RiskExceptionConfigurationType\",\
          \"documentation\":\"<p>The configuration to override the risk decision.</p>\"\
        }\
      }\
    },\
    \"SetRiskConfigurationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"RiskConfiguration\"],\
      \"members\":{\
        \"RiskConfiguration\":{\
          \"shape\":\"RiskConfigurationType\",\
          \"documentation\":\"<p>The risk configuration.</p>\"\
        }\
      }\
    },\
    \"SetUICustomizationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The client ID for the client app.</p>\"\
        },\
        \"CSS\":{\
          \"shape\":\"CSSType\",\
          \"documentation\":\"<p>The CSS values in the UI customization.</p>\"\
        },\
        \"ImageFile\":{\
          \"shape\":\"ImageFileType\",\
          \"documentation\":\"<p>The uploaded logo image for the UI customization.</p>\"\
        }\
      }\
    },\
    \"SetUICustomizationResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"UICustomization\"],\
      \"members\":{\
        \"UICustomization\":{\
          \"shape\":\"UICustomizationType\",\
          \"documentation\":\"<p>The UI customization information.</p>\"\
        }\
      }\
    },\
    \"SetUserMFAPreferenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AccessToken\"],\
      \"members\":{\
        \"SMSMfaSettings\":{\
          \"shape\":\"SMSMfaSettingsType\",\
          \"documentation\":\"<p>The SMS text message multi-factor authentication (MFA) settings.</p>\"\
        },\
        \"SoftwareTokenMfaSettings\":{\
          \"shape\":\"SoftwareTokenMfaSettingsType\",\
          \"documentation\":\"<p>The time-based one-time password software token MFA settings.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token for the user.</p>\"\
        }\
      }\
    },\
    \"SetUserMFAPreferenceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"SetUserPoolMfaConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"SmsMfaConfiguration\":{\
          \"shape\":\"SmsMfaConfigType\",\
          \"documentation\":\"<p>The SMS text message MFA configuration.</p>\"\
        },\
        \"SoftwareTokenMfaConfiguration\":{\
          \"shape\":\"SoftwareTokenMfaConfigType\",\
          \"documentation\":\"<p>The software token MFA configuration.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>The MFA configuration. Valid values include:</p> <ul> <li> <p> <code>OFF</code> MFA will not be used for any users.</p> </li> <li> <p> <code>ON</code> MFA is required for all users to sign in.</p> </li> <li> <p> <code>OPTIONAL</code> MFA will be required only for individual users who have an MFA factor enabled.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"SetUserPoolMfaConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SmsMfaConfiguration\":{\
          \"shape\":\"SmsMfaConfigType\",\
          \"documentation\":\"<p>The SMS text message MFA configuration.</p>\"\
        },\
        \"SoftwareTokenMfaConfiguration\":{\
          \"shape\":\"SoftwareTokenMfaConfigType\",\
          \"documentation\":\"<p>The software token MFA configuration.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>The MFA configuration. Valid values include:</p> <ul> <li> <p> <code>OFF</code> MFA will not be used for any users.</p> </li> <li> <p> <code>ON</code> MFA is required for all users to sign in.</p> </li> <li> <p> <code>OPTIONAL</code> MFA will be required only for individual users who have an MFA factor enabled.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"SetUserSettingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"MFAOptions\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token for the set user settings request.</p>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p>You can use this parameter only to set an SMS configuration that uses SMS for delivery.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to set user settings.</p>\"\
    },\
    \"SetUserSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response from the server for a set user settings request.</p>\"\
    },\
    \"SignUpRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ClientId\",\
        \"Username\",\
        \"Password\"\
      ],\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"SecretHash\":{\
          \"shape\":\"SecretHashType\",\
          \"documentation\":\"<p>A keyed-hash message authentication code (HMAC) calculated using the secret key of a user pool client and username plus the client ID in the message.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to register.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"PasswordType\",\
          \"documentation\":\"<p>The password of the user you wish to register.</p>\"\
        },\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>\"\
        },\
        \"ValidationData\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>The validation data in the request to register a user.</p>\"\
        },\
        \"AnalyticsMetadata\":{\
          \"shape\":\"AnalyticsMetadataType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics metadata for collecting metrics for <code>SignUp</code> calls.</p>\"\
        },\
        \"UserContextData\":{\
          \"shape\":\"UserContextDataType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the SignUp API action, Amazon Cognito invokes any functions that are assigned to the following triggers: <i>pre sign-up</i>, <i>custom message</i>, and <i>post confirmation</i>. When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your SignUp request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to register a user.</p>\"\
    },\
    \"SignUpResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserConfirmed\",\
        \"UserSub\"\
      ],\
      \"members\":{\
        \"UserConfirmed\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>A response from the server indicating that a user registration has been confirmed.</p>\"\
        },\
        \"CodeDeliveryDetails\":{\
          \"shape\":\"CodeDeliveryDetailsType\",\
          \"documentation\":\"<p>The code delivery details returned by the server response to the user registration request.</p>\"\
        },\
        \"UserSub\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The UUID of the authenticated user. This is not the same as <code>username</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The response from the server for a registration request.</p>\"\
    },\
    \"SkippedIPRangeListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StringType\"},\
      \"max\":20\
    },\
    \"SmsConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\"SnsCallerArn\"],\
      \"members\":{\
        \"SnsCallerArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (SNS) caller. This is the ARN of the IAM role in your AWS account which Cognito will use to send SMS messages.</p>\"\
        },\
        \"ExternalId\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The external ID is a value that we recommend you use to add security to your IAM role which is used to call Amazon SNS to send SMS messages for your user pool. If you provide an <code>ExternalId</code>, the Cognito User Pool will include it when attempting to assume your IAM role, so that you can set your roles trust policy to require the <code>ExternalID</code>. If you use the Cognito Management Console to create a role for SMS MFA, Cognito will create a role with the required permissions and a trust policy that demonstrates use of the <code>ExternalId</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The SMS configuration type that includes the settings the Cognito User Pool needs to call for the Amazon SNS service to send an SMS message from your AWS account. The Cognito User Pool makes the request to the Amazon SNS Service by using an AWS IAM role that you provide for your AWS account.</p>\"\
    },\
    \"SmsMfaConfigType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SmsAuthenticationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The SMS authentication message that will be sent to users with the code they need to sign in. The message must contain the â{####}â placeholder, which will be replaced with the code. If the message is not included, and default message will be used.</p>\"\
        },\
        \"SmsConfiguration\":{\
          \"shape\":\"SmsConfigurationType\",\
          \"documentation\":\"<p>The SMS configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The SMS text message multi-factor authentication (MFA) configuration type.</p>\"\
    },\
    \"SmsVerificationMessageType\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":6,\
      \"pattern\":\".*\\\\{####\\\\}.*\"\
    },\
    \"SoftwareTokenMFANotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when the software token TOTP multi-factor authentication (MFA) is not enabled for the user pool.</p>\",\
      \"exception\":true\
    },\
    \"SoftwareTokenMFAUserCodeType\":{\
      \"type\":\"string\",\
      \"max\":6,\
      \"min\":6,\
      \"pattern\":\"[0-9]+\"\
    },\
    \"SoftwareTokenMfaConfigType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether software token MFA is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type used for enabling software token MFA at the user pool level.</p>\"\
    },\
    \"SoftwareTokenMfaSettingsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether software token MFA is enabled.</p>\"\
        },\
        \"PreferredMfa\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether software token MFA is the preferred MFA method.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The type used for enabling software token MFA at the user level.</p>\"\
    },\
    \"StartUserImportJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"JobId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are being imported into.</p>\"\
        },\
        \"JobId\":{\
          \"shape\":\"UserImportJobIdType\",\
          \"documentation\":\"<p>The job ID for the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to start the user import job.</p>\"\
    },\
    \"StartUserImportJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserImportJob\":{\
          \"shape\":\"UserImportJobType\",\
          \"documentation\":\"<p>The job object that represents the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to start the user import job.</p>\"\
    },\
    \"StatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Enabled\",\
        \"Disabled\"\
      ]\
    },\
    \"StopUserImportJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"JobId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are being imported into.</p>\"\
        },\
        \"JobId\":{\
          \"shape\":\"UserImportJobIdType\",\
          \"documentation\":\"<p>The job ID for the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to stop the user import job.</p>\"\
    },\
    \"StopUserImportJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserImportJob\":{\
          \"shape\":\"UserImportJobType\",\
          \"documentation\":\"<p>The job object that represents the user import job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to stop the user import job.</p>\"\
    },\
    \"StringAttributeConstraintsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinLength\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The minimum length.</p>\"\
        },\
        \"MaxLength\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The maximum length.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The constraints associated with a string attribute.</p>\"\
    },\
    \"StringType\":{\"type\":\"string\"},\
    \"SupportedIdentityProvidersListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProviderNameType\"}\
    },\
    \"TagKeysType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user pool to assign the tags to.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"UserPoolTagsType\",\
          \"documentation\":\"<p>The tags to assign to the user pool.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValueType\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"TemporaryPasswordValidityDaysType\":{\
      \"type\":\"integer\",\
      \"max\":365,\
      \"min\":0\
    },\
    \"TimeUnitsType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"seconds\",\
        \"minutes\",\
        \"hours\",\
        \"days\"\
      ]\
    },\
    \"TokenModelType\":{\
      \"type\":\"string\",\
      \"pattern\":\"[A-Za-z0-9-_=.]+\",\
      \"sensitive\":true\
    },\
    \"TokenValidityUnitsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TimeUnitsType\",\
          \"documentation\":\"<p> A time unit in âsecondsâ, âminutesâ, âhoursâ or âdaysâ for the value in AccessTokenValidity, defaults to hours.</p>\"\
        },\
        \"IdToken\":{\
          \"shape\":\"TimeUnitsType\",\
          \"documentation\":\"<p>A time unit in âsecondsâ, âminutesâ, âhoursâ or âdaysâ for the value in IdTokenValidity, defaults to hours.</p>\"\
        },\
        \"RefreshToken\":{\
          \"shape\":\"TimeUnitsType\",\
          \"documentation\":\"<p>A time unit in âsecondsâ, âminutesâ, âhoursâ or âdaysâ for the value in RefreshTokenValidity, defaults to days.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The data type for TokenValidityUnits that specifics the time measurements for token validity.</p>\"\
    },\
    \"TooManyFailedAttemptsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a too many failed attempts exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the user has made too many failed attempts for a given action (e.g., sign in).</p>\",\
      \"exception\":true\
    },\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a too many requests exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the user has made too many requests for a given operation.</p>\",\
      \"exception\":true\
    },\
    \"UICustomizationType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The client ID for the client app.</p>\"\
        },\
        \"ImageUrl\":{\
          \"shape\":\"ImageUrlType\",\
          \"documentation\":\"<p>The logo image for the UI customization.</p>\"\
        },\
        \"CSS\":{\
          \"shape\":\"CSSType\",\
          \"documentation\":\"<p>The CSS values in the UI customization.</p>\"\
        },\
        \"CSSVersion\":{\
          \"shape\":\"CSSVersionType\",\
          \"documentation\":\"<p>The CSS version number.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last-modified date for the UI customization.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date for the UI customization.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container for the UI customization information for a user pool's built-in app UI.</p>\"\
    },\
    \"UnexpectedLambdaException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns an unexpected AWS Lambda exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters an unexpected exception with the AWS Lambda service.</p>\",\
      \"exception\":true\
    },\
    \"UnsupportedIdentityProviderException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when the specified identifier is not supported.</p>\",\
      \"exception\":true\
    },\
    \"UnsupportedUserStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the user is in an unsupported state.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request failed because the user is in an unsupported state.</p>\",\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"UserPoolTagsListType\",\
          \"documentation\":\"<p>The keys of the tags to remove from the user pool.</p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateAuthEventFeedbackRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Username\",\
        \"EventId\",\
        \"FeedbackToken\",\
        \"FeedbackValue\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user pool username.</p>\"\
        },\
        \"EventId\":{\
          \"shape\":\"EventIdType\",\
          \"documentation\":\"<p>The event ID.</p>\"\
        },\
        \"FeedbackToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The feedback token.</p>\"\
        },\
        \"FeedbackValue\":{\
          \"shape\":\"FeedbackValueType\",\
          \"documentation\":\"<p>The authentication event feedback value.</p>\"\
        }\
      }\
    },\
    \"UpdateAuthEventFeedbackResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateDeviceStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"DeviceKey\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        },\
        \"DeviceKey\":{\
          \"shape\":\"DeviceKeyType\",\
          \"documentation\":\"<p>The device key.</p>\"\
        },\
        \"DeviceRememberedStatus\":{\
          \"shape\":\"DeviceRememberedStatusType\",\
          \"documentation\":\"<p>The status of whether a device is remembered.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the device status.</p>\"\
    },\
    \"UpdateDeviceStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The response to the request to update the device status.</p>\"\
    },\
    \"UpdateGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GroupName\",\
        \"UserPoolId\"\
      ],\
      \"members\":{\
        \"GroupName\":{\
          \"shape\":\"GroupNameType\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"DescriptionType\",\
          \"documentation\":\"<p>A string containing the new description of the group.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The new role ARN for the group. This is used for setting the <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims in the token.</p>\"\
        },\
        \"Precedence\":{\
          \"shape\":\"PrecedenceType\",\
          \"documentation\":\"<p>The new precedence value for the group. For more information about this parameter, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_CreateGroup.html\\\">CreateGroup</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Group\":{\
          \"shape\":\"GroupType\",\
          \"documentation\":\"<p>The group object for the group.</p>\"\
        }\
      }\
    },\
    \"UpdateIdentityProviderRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ProviderName\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID.</p>\"\
        },\
        \"ProviderName\":{\
          \"shape\":\"ProviderNameType\",\
          \"documentation\":\"<p>The identity provider name.</p>\"\
        },\
        \"ProviderDetails\":{\
          \"shape\":\"ProviderDetailsType\",\
          \"documentation\":\"<p>The identity provider details to be updated, such as <code>MetadataURL</code> and <code>MetadataFile</code>.</p>\"\
        },\
        \"AttributeMapping\":{\
          \"shape\":\"AttributeMappingType\",\
          \"documentation\":\"<p>The identity provider attribute mapping to be changed.</p>\"\
        },\
        \"IdpIdentifiers\":{\
          \"shape\":\"IdpIdentifiersListType\",\
          \"documentation\":\"<p>A list of identity provider identifiers.</p>\"\
        }\
      }\
    },\
    \"UpdateIdentityProviderResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"IdentityProvider\"],\
      \"members\":{\
        \"IdentityProvider\":{\
          \"shape\":\"IdentityProviderType\",\
          \"documentation\":\"<p>The identity provider object.</p>\"\
        }\
      }\
    },\
    \"UpdateResourceServerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"Identifier\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool.</p>\"\
        },\
        \"Identifier\":{\
          \"shape\":\"ResourceServerIdentifierType\",\
          \"documentation\":\"<p>The identifier for the resource server.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceServerNameType\",\
          \"documentation\":\"<p>The name of the resource server.</p>\"\
        },\
        \"Scopes\":{\
          \"shape\":\"ResourceServerScopeListType\",\
          \"documentation\":\"<p>The scope values to be set for the resource server.</p>\"\
        }\
      }\
    },\
    \"UpdateResourceServerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceServer\"],\
      \"members\":{\
        \"ResourceServer\":{\
          \"shape\":\"ResourceServerType\",\
          \"documentation\":\"<p>The resource server.</p>\"\
        }\
      }\
    },\
    \"UpdateUserAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserAttributes\",\
        \"AccessToken\"\
      ],\
      \"members\":{\
        \"UserAttributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>An array of name-value pairs representing user attributes.</p> <p>For custom attributes, you must prepend the <code>custom:</code> prefix to the attribute name.</p>\"\
        },\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token for the request to update user attributes.</p>\"\
        },\
        \"ClientMetadata\":{\
          \"shape\":\"ClientMetadataType\",\
          \"documentation\":\"<p>A map of custom key-value pairs that you can provide as input for any custom workflows that this action triggers. </p> <p>You create custom workflows by assigning AWS Lambda functions to user pool triggers. When you use the UpdateUserAttributes API action, Amazon Cognito invokes the function that is assigned to the <i>custom message</i> trigger. When Amazon Cognito invokes this function, it passes a JSON payload, which the function receives as input. This payload contains a <code>clientMetadata</code> attribute, which provides the data that you assigned to the ClientMetadata parameter in your UpdateUserAttributes request. In your function code in AWS Lambda, you can process the <code>clientMetadata</code> value to enhance your workflow for your specific needs.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html\\\">Customizing User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito Developer Guide</i>.</p> <note> <p>Take the following limitations into consideration when you use the ClientMetadata parameter:</p> <ul> <li> <p>Amazon Cognito does not store the ClientMetadata value. This data is available only to AWS Lambda triggers that are assigned to a user pool to support custom workflows. If your user pool configuration does not include triggers, the ClientMetadata parameter serves no purpose.</p> </li> <li> <p>Amazon Cognito does not validate the ClientMetadata value.</p> </li> <li> <p>Amazon Cognito does not encrypt the the ClientMetadata value, so don't use it to provide sensitive information.</p> </li> </ul> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update user attributes.</p>\"\
    },\
    \"UpdateUserAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CodeDeliveryDetailsList\":{\
          \"shape\":\"CodeDeliveryDetailsListType\",\
          \"documentation\":\"<p>The code delivery details list from the server for the request to update user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server for the request to update user attributes.</p>\"\
    },\
    \"UpdateUserPoolClientRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserPoolId\",\
        \"ClientId\"\
      ],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to update the user pool client.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name from the update user pool client request.</p>\"\
        },\
        \"RefreshTokenValidity\":{\
          \"shape\":\"RefreshTokenValidityType\",\
          \"documentation\":\"<p>The time limit, in days, after which the refresh token is no longer valid and cannot be used.</p>\"\
        },\
        \"AccessTokenValidity\":{\
          \"shape\":\"AccessTokenValidityType\",\
          \"documentation\":\"<p>The time limit, after which the access token is no longer valid and cannot be used.</p>\"\
        },\
        \"IdTokenValidity\":{\
          \"shape\":\"IdTokenValidityType\",\
          \"documentation\":\"<p>The time limit, after which the ID token is no longer valid and cannot be used.</p>\"\
        },\
        \"TokenValidityUnits\":{\
          \"shape\":\"TokenValidityUnitsType\",\
          \"documentation\":\"<p>The units in which the validity times are represented in. Default for RefreshToken is days, and default for ID and access tokens are hours.</p>\"\
        },\
        \"ReadAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The read-only attributes of the user pool.</p>\"\
        },\
        \"WriteAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The writeable attributes of the user pool.</p>\"\
        },\
        \"ExplicitAuthFlows\":{\
          \"shape\":\"ExplicitAuthFlowsListType\",\
          \"documentation\":\"<p>The authentication flows that are supported by the user pool clients. Flow names without the <code>ALLOW_</code> prefix are deprecated in favor of new names with the <code>ALLOW_</code> prefix. Note that values with <code>ALLOW_</code> prefix cannot be used along with values without <code>ALLOW_</code> prefix.</p> <p>Valid values include:</p> <ul> <li> <p> <code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this authentication flow, Cognito receives the password in the request instead of using the SRP (Secure Remote Password protocol) protocol to verify passwords.</p> </li> <li> <p> <code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based authentication.</p> </li> <li> <p> <code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based authentication. In this flow, Cognito receives the password in the request instead of using the SRP protocol to verify passwords.</p> </li> <li> <p> <code>ALLOW_USER_SRP_AUTH</code>: Enable SRP based authentication.</p> </li> <li> <p> <code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.</p> </li> </ul>\"\
        },\
        \"SupportedIdentityProviders\":{\
          \"shape\":\"SupportedIdentityProvidersListType\",\
          \"documentation\":\"<p>A list of provider names for the identity providers that are supported on this client.</p>\"\
        },\
        \"CallbackURLs\":{\
          \"shape\":\"CallbackURLsListType\",\
          \"documentation\":\"<p>A list of allowed redirect (callback) URLs for the identity providers.</p> <p>A redirect URI must:</p> <ul> <li> <p>Be an absolute URI.</p> </li> <li> <p>Be registered with the authorization server.</p> </li> <li> <p>Not include a fragment component.</p> </li> </ul> <p>See <a href=\\\"https://tools.ietf.org/html/rfc6749#section-3.1.2\\\">OAuth 2.0 - Redirection Endpoint</a>.</p> <p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p> <p>App callback URLs such as myapp://example are also supported.</p>\"\
        },\
        \"LogoutURLs\":{\
          \"shape\":\"LogoutURLsListType\",\
          \"documentation\":\"<p>A list of allowed logout URLs for the identity providers.</p>\"\
        },\
        \"DefaultRedirectURI\":{\
          \"shape\":\"RedirectUrlType\",\
          \"documentation\":\"<p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p> <p>A redirect URI must:</p> <ul> <li> <p>Be an absolute URI.</p> </li> <li> <p>Be registered with the authorization server.</p> </li> <li> <p>Not include a fragment component.</p> </li> </ul> <p>See <a href=\\\"https://tools.ietf.org/html/rfc6749#section-3.1.2\\\">OAuth 2.0 - Redirection Endpoint</a>.</p> <p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p> <p>App callback URLs such as myapp://example are also supported.</p>\"\
        },\
        \"AllowedOAuthFlows\":{\
          \"shape\":\"OAuthFlowsType\",\
          \"documentation\":\"<p>The allowed OAuth flows.</p> <p>Set to <code>code</code> to initiate a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the token endpoint.</p> <p>Set to <code>implicit</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) directly.</p> <p>Set to <code>client_credentials</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) from the token endpoint using a combination of client and client_secret.</p>\"\
        },\
        \"AllowedOAuthScopes\":{\
          \"shape\":\"ScopeListType\",\
          \"documentation\":\"<p>The allowed OAuth scopes. Possible values provided by OAuth are: <code>phone</code>, <code>email</code>, <code>openid</code>, and <code>profile</code>. Possible values provided by AWS are: <code>aws.cognito.signin.user.admin</code>. Custom scopes created in Resource Servers are also supported.</p>\"\
        },\
        \"AllowedOAuthFlowsUserPoolClient\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Set to true if the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.</p>\"\
        },\
        \"AnalyticsConfiguration\":{\
          \"shape\":\"AnalyticsConfigurationType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics configuration for collecting metrics for this user pool.</p> <note> <p>In regions where Pinpoint is not available, Cognito User Pools only supports sending events to Amazon Pinpoint projects in us-east-1. In regions where Pinpoint is available, Cognito User Pools will support sending events to Amazon Pinpoint projects within that same region. </p> </note>\"\
        },\
        \"PreventUserExistenceErrors\":{\
          \"shape\":\"PreventUserExistenceErrorTypes\",\
          \"documentation\":\"<p>Use this setting to choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. When set to <code>ENABLED</code> and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to <code>LEGACY</code>, those APIs will return a <code>UserNotFoundException</code> exception if the user does not exist in the user pool.</p> <p>Valid values include:</p> <ul> <li> <p> <code>ENABLED</code> - This prevents user existence-related errors.</p> </li> <li> <p> <code>LEGACY</code> - This represents the old behavior of Cognito where user existence related errors are not prevented.</p> </li> </ul> <note> <p>After February 15th 2020, the value of <code>PreventUserExistenceErrors</code> will default to <code>ENABLED</code> for newly created user pool clients if no value is provided.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the user pool client.</p>\"\
    },\
    \"UpdateUserPoolClientResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolClient\":{\
          \"shape\":\"UserPoolClientType\",\
          \"documentation\":\"<p>The user pool client value from the response from the server when an update user pool client request is made.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the response from the server to the request to update the user pool client.</p>\"\
    },\
    \"UpdateUserPoolDomainRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Domain\",\
        \"UserPoolId\",\
        \"CustomDomainConfig\"\
      ],\
      \"members\":{\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The domain name for the custom domain that hosts the sign-up and sign-in pages for your application. For example: <code>auth.example.com</code>. </p> <p>This string can include only lowercase letters, numbers, and hyphens. Do not use a hyphen for the first or last character. Use periods to separate subdomain names.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the user pool that is associated with the custom domain that you are updating the certificate for.</p>\"\
        },\
        \"CustomDomainConfig\":{\
          \"shape\":\"CustomDomainConfigType\",\
          \"documentation\":\"<p>The configuration for a custom domain that hosts the sign-up and sign-in pages for your application. Use this object to specify an SSL certificate that is managed by ACM.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateUserPoolDomain request input.</p>\"\
    },\
    \"UpdateUserPoolDomainResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CloudFrontDomain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>The Amazon CloudFront endpoint that Amazon Cognito set up when you added the custom domain to your user pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The UpdateUserPoolDomain response output.</p>\"\
    },\
    \"UpdateUserPoolRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserPoolId\"],\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool you want to update.</p>\"\
        },\
        \"Policies\":{\
          \"shape\":\"UserPoolPolicyType\",\
          \"documentation\":\"<p>A container with the policies you wish to update in a user pool.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>The AWS Lambda configuration information from the request to update the user pool.</p>\"\
        },\
        \"AutoVerifiedAttributes\":{\
          \"shape\":\"VerifiedAttributesListType\",\
          \"documentation\":\"<p>The attributes that are automatically verified when the Amazon Cognito service makes a request to update user pools.</p>\"\
        },\
        \"SmsVerificationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>A container with information about the SMS verification message.</p>\"\
        },\
        \"EmailVerificationMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the email verification message.</p>\"\
        },\
        \"EmailVerificationSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>The subject of the email verification message.</p>\"\
        },\
        \"VerificationMessageTemplate\":{\
          \"shape\":\"VerificationMessageTemplateType\",\
          \"documentation\":\"<p>The template for verification messages.</p>\"\
        },\
        \"SmsAuthenticationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the SMS authentication message.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>Can be one of the following values:</p> <ul> <li> <p> <code>OFF</code> - MFA tokens are not required and cannot be specified during user registration.</p> </li> <li> <p> <code>ON</code> - MFA tokens are required for all user registrations. You can only specify required when you are initially creating a user pool.</p> </li> <li> <p> <code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</p> </li> </ul>\"\
        },\
        \"DeviceConfiguration\":{\
          \"shape\":\"DeviceConfigurationType\",\
          \"documentation\":\"<p>Device configuration.</p>\"\
        },\
        \"EmailConfiguration\":{\
          \"shape\":\"EmailConfigurationType\",\
          \"documentation\":\"<p>Email configuration.</p>\"\
        },\
        \"SmsConfiguration\":{\
          \"shape\":\"SmsConfigurationType\",\
          \"documentation\":\"<p>SMS configuration.</p>\"\
        },\
        \"UserPoolTags\":{\
          \"shape\":\"UserPoolTagsType\",\
          \"documentation\":\"<p>The tag keys and values to assign to the user pool. A tag is a label that you can use to categorize and manage user pools in different ways, such as by purpose, owner, environment, or other criteria.</p>\"\
        },\
        \"AdminCreateUserConfig\":{\
          \"shape\":\"AdminCreateUserConfigType\",\
          \"documentation\":\"<p>The configuration for <code>AdminCreateUser</code> requests.</p>\"\
        },\
        \"UserPoolAddOns\":{\
          \"shape\":\"UserPoolAddOnsType\",\
          \"documentation\":\"<p>Used to enable advanced security risk detection. Set the key <code>AdvancedSecurityMode</code> to the value \\\"AUDIT\\\".</p>\"\
        },\
        \"AccountRecoverySetting\":{\
          \"shape\":\"AccountRecoverySettingType\",\
          \"documentation\":\"<p>Use this setting to define which verified available method a user can use to recover their password when they call <code>ForgotPassword</code>. It allows you to define a preferred method when a user has more than one method available. With this setting, SMS does not qualify for a valid password recovery mechanism if the user also has SMS MFA enabled. In the absence of this setting, Cognito uses the legacy behavior to determine the recovery method where SMS is preferred over email.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to update the user pool.</p>\"\
    },\
    \"UpdateUserPoolResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Represents the response from the server when you make a request to update the user pool.</p>\"\
    },\
    \"UserContextDataType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EncodedData\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contextual data such as the user's device fingerprint, IP address, or location used for evaluating the risk of an unexpected event by Amazon Cognito advanced security.</p>\"\
    },\
    \"UserFilterType\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"UserImportInProgressException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the user pool has an import job running.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when you are trying to modify a user pool while a user import job is in progress for that pool.</p>\",\
      \"exception\":true\
    },\
    \"UserImportJobIdType\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"import-[0-9a-zA-Z-]+\"\
    },\
    \"UserImportJobNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\s+=,.@-]+\"\
    },\
    \"UserImportJobStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Created\",\
        \"Pending\",\
        \"InProgress\",\
        \"Stopping\",\
        \"Expired\",\
        \"Stopped\",\
        \"Failed\",\
        \"Succeeded\"\
      ]\
    },\
    \"UserImportJobType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"UserImportJobNameType\",\
          \"documentation\":\"<p>The job name for the user import job.</p>\"\
        },\
        \"JobId\":{\
          \"shape\":\"UserImportJobIdType\",\
          \"documentation\":\"<p>The job ID for the user import job.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool that the users are being imported into.</p>\"\
        },\
        \"PreSignedUrl\":{\
          \"shape\":\"PreSignedUrlType\",\
          \"documentation\":\"<p>The pre-signed URL to be used to upload the <code>.csv</code> file.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user import job was created.</p>\"\
        },\
        \"StartDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the user import job was started.</p>\"\
        },\
        \"CompletionDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date when the user import job was completed.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"UserImportJobStatusType\",\
          \"documentation\":\"<p>The status of the user import job. One of the following:</p> <ul> <li> <p> <code>Created</code> - The job was created but not started.</p> </li> <li> <p> <code>Pending</code> - A transition state. You have started the job, but it has not begun importing users yet.</p> </li> <li> <p> <code>InProgress</code> - The job has started, and users are being imported.</p> </li> <li> <p> <code>Stopping</code> - You have stopped the job, but the job has not stopped importing users yet.</p> </li> <li> <p> <code>Stopped</code> - You have stopped the job, and the job has stopped importing users.</p> </li> <li> <p> <code>Succeeded</code> - The job has completed successfully.</p> </li> <li> <p> <code>Failed</code> - The job has stopped due to an error.</p> </li> <li> <p> <code>Expired</code> - You created a job, but did not start the job within 24-48 hours. All data associated with the job was deleted, and the job cannot be started.</p> </li> </ul>\"\
        },\
        \"CloudWatchLogsRoleArn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The role ARN for the Amazon CloudWatch Logging role for the user import job. For more information, see \\\"Creating the CloudWatch Logs IAM Role\\\" in the Amazon Cognito Developer Guide.</p>\"\
        },\
        \"ImportedUsers\":{\
          \"shape\":\"LongType\",\
          \"documentation\":\"<p>The number of users that were successfully imported.</p>\"\
        },\
        \"SkippedUsers\":{\
          \"shape\":\"LongType\",\
          \"documentation\":\"<p>The number of users that were skipped.</p>\"\
        },\
        \"FailedUsers\":{\
          \"shape\":\"LongType\",\
          \"documentation\":\"<p>The number of users that could not be imported.</p>\"\
        },\
        \"CompletionMessage\":{\
          \"shape\":\"CompletionMessageType\",\
          \"documentation\":\"<p>The message returned when the user import job is completed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user import job type.</p>\"\
    },\
    \"UserImportJobsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserImportJobType\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"UserLambdaValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when the Amazon Cognito service returns a user validation exception with the AWS Lambda service.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when the Amazon Cognito service encounters a user validation exception with the AWS Lambda service.</p>\",\
      \"exception\":true\
    },\
    \"UserMFASettingListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StringType\"}\
    },\
    \"UserNotConfirmedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when a user is not confirmed successfully.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user is not confirmed successfully.</p>\",\
      \"exception\":true\
    },\
    \"UserNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when a user is not found.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when a user is not found.</p>\",\
      \"exception\":true\
    },\
    \"UserPoolAddOnNotEnabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when user pool add-ons are not enabled.</p>\",\
      \"exception\":true\
    },\
    \"UserPoolAddOnsType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AdvancedSecurityMode\"],\
      \"members\":{\
        \"AdvancedSecurityMode\":{\
          \"shape\":\"AdvancedSecurityModeType\",\
          \"documentation\":\"<p>The advanced security mode.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user pool add-ons type.</p>\"\
    },\
    \"UserPoolClientDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool where you want to describe the user pool client.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name from the user pool client description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The description of the user pool client.</p>\"\
    },\
    \"UserPoolClientListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserPoolClientDescription\"}\
    },\
    \"UserPoolClientType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserPoolId\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The user pool ID for the user pool client.</p>\"\
        },\
        \"ClientName\":{\
          \"shape\":\"ClientNameType\",\
          \"documentation\":\"<p>The client name from the user pool request of the client type.</p>\"\
        },\
        \"ClientId\":{\
          \"shape\":\"ClientIdType\",\
          \"documentation\":\"<p>The ID of the client associated with the user pool.</p>\"\
        },\
        \"ClientSecret\":{\
          \"shape\":\"ClientSecretType\",\
          \"documentation\":\"<p>The client secret from the user pool request of the client type.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user pool client was last modified.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user pool client was created.</p>\"\
        },\
        \"RefreshTokenValidity\":{\
          \"shape\":\"RefreshTokenValidityType\",\
          \"documentation\":\"<p>The time limit, in days, after which the refresh token is no longer valid and cannot be used.</p>\"\
        },\
        \"AccessTokenValidity\":{\
          \"shape\":\"AccessTokenValidityType\",\
          \"documentation\":\"<p>The time limit, specified by tokenValidityUnits, defaulting to hours, after which the access token is no longer valid and cannot be used.</p>\"\
        },\
        \"IdTokenValidity\":{\
          \"shape\":\"IdTokenValidityType\",\
          \"documentation\":\"<p>The time limit, specified by tokenValidityUnits, defaulting to hours, after which the refresh token is no longer valid and cannot be used.</p>\"\
        },\
        \"TokenValidityUnits\":{\
          \"shape\":\"TokenValidityUnitsType\",\
          \"documentation\":\"<p>The time units used to specify the token validity times of their respective token.</p>\"\
        },\
        \"ReadAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The Read-only attributes.</p>\"\
        },\
        \"WriteAttributes\":{\
          \"shape\":\"ClientPermissionListType\",\
          \"documentation\":\"<p>The writeable attributes.</p>\"\
        },\
        \"ExplicitAuthFlows\":{\
          \"shape\":\"ExplicitAuthFlowsListType\",\
          \"documentation\":\"<p>The authentication flows that are supported by the user pool clients. Flow names without the <code>ALLOW_</code> prefix are deprecated in favor of new names with the <code>ALLOW_</code> prefix. Note that values with <code>ALLOW_</code> prefix cannot be used along with values without <code>ALLOW_</code> prefix.</p> <p>Valid values include:</p> <ul> <li> <p> <code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this authentication flow, Cognito receives the password in the request instead of using the SRP (Secure Remote Password protocol) protocol to verify passwords.</p> </li> <li> <p> <code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based authentication.</p> </li> <li> <p> <code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based authentication. In this flow, Cognito receives the password in the request instead of using the SRP protocol to verify passwords.</p> </li> <li> <p> <code>ALLOW_USER_SRP_AUTH</code>: Enable SRP based authentication.</p> </li> <li> <p> <code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.</p> </li> </ul>\"\
        },\
        \"SupportedIdentityProviders\":{\
          \"shape\":\"SupportedIdentityProvidersListType\",\
          \"documentation\":\"<p>A list of provider names for the identity providers that are supported on this client.</p>\"\
        },\
        \"CallbackURLs\":{\
          \"shape\":\"CallbackURLsListType\",\
          \"documentation\":\"<p>A list of allowed redirect (callback) URLs for the identity providers.</p> <p>A redirect URI must:</p> <ul> <li> <p>Be an absolute URI.</p> </li> <li> <p>Be registered with the authorization server.</p> </li> <li> <p>Not include a fragment component.</p> </li> </ul> <p>See <a href=\\\"https://tools.ietf.org/html/rfc6749#section-3.1.2\\\">OAuth 2.0 - Redirection Endpoint</a>.</p> <p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p> <p>App callback URLs such as myapp://example are also supported.</p>\"\
        },\
        \"LogoutURLs\":{\
          \"shape\":\"LogoutURLsListType\",\
          \"documentation\":\"<p>A list of allowed logout URLs for the identity providers.</p>\"\
        },\
        \"DefaultRedirectURI\":{\
          \"shape\":\"RedirectUrlType\",\
          \"documentation\":\"<p>The default redirect URI. Must be in the <code>CallbackURLs</code> list.</p> <p>A redirect URI must:</p> <ul> <li> <p>Be an absolute URI.</p> </li> <li> <p>Be registered with the authorization server.</p> </li> <li> <p>Not include a fragment component.</p> </li> </ul> <p>See <a href=\\\"https://tools.ietf.org/html/rfc6749#section-3.1.2\\\">OAuth 2.0 - Redirection Endpoint</a>.</p> <p>Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing purposes only.</p> <p>App callback URLs such as myapp://example are also supported.</p>\"\
        },\
        \"AllowedOAuthFlows\":{\
          \"shape\":\"OAuthFlowsType\",\
          \"documentation\":\"<p>The allowed OAuth flows.</p> <p>Set to <code>code</code> to initiate a code grant flow, which provides an authorization code as the response. This code can be exchanged for access tokens with the token endpoint.</p> <p>Set to <code>implicit</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) directly.</p> <p>Set to <code>client_credentials</code> to specify that the client should get the access token (and, optionally, ID token, based on scopes) from the token endpoint using a combination of client and client_secret.</p>\"\
        },\
        \"AllowedOAuthScopes\":{\
          \"shape\":\"ScopeListType\",\
          \"documentation\":\"<p>The allowed OAuth scopes. Possible values provided by OAuth are: <code>phone</code>, <code>email</code>, <code>openid</code>, and <code>profile</code>. Possible values provided by AWS are: <code>aws.cognito.signin.user.admin</code>. Custom scopes created in Resource Servers are also supported.</p>\"\
        },\
        \"AllowedOAuthFlowsUserPoolClient\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Set to true if the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.</p>\",\
          \"box\":true\
        },\
        \"AnalyticsConfiguration\":{\
          \"shape\":\"AnalyticsConfigurationType\",\
          \"documentation\":\"<p>The Amazon Pinpoint analytics configuration for the user pool client.</p> <note> <p>Cognito User Pools only supports sending events to Amazon Pinpoint projects in the US East (N. Virginia) us-east-1 Region, regardless of the region in which the user pool resides.</p> </note>\"\
        },\
        \"PreventUserExistenceErrors\":{\
          \"shape\":\"PreventUserExistenceErrorTypes\",\
          \"documentation\":\"<p>Use this setting to choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. When set to <code>ENABLED</code> and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to <code>LEGACY</code>, those APIs will return a <code>UserNotFoundException</code> exception if the user does not exist in the user pool.</p> <p>Valid values include:</p> <ul> <li> <p> <code>ENABLED</code> - This prevents user existence-related errors.</p> </li> <li> <p> <code>LEGACY</code> - This represents the old behavior of Cognito where user existence related errors are not prevented.</p> </li> </ul> <note> <p>After February 15th 2020, the value of <code>PreventUserExistenceErrors</code> will default to <code>ENABLED</code> for newly created user pool clients if no value is provided.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a user pool client.</p>\"\
    },\
    \"UserPoolDescriptionType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID in a user pool description.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"UserPoolNameType\",\
          \"documentation\":\"<p>The name in a user pool description.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>The AWS Lambda configuration information in a user pool description.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusType\",\
          \"documentation\":\"<p>The user pool status in a user pool description.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user pool description was last modified.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user pool description was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A user pool description.</p>\"\
    },\
    \"UserPoolIdType\":{\
      \"type\":\"string\",\
      \"max\":55,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]+_[0-9a-zA-Z]+\"\
    },\
    \"UserPoolListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserPoolDescriptionType\"}\
    },\
    \"UserPoolMfaType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"OFF\",\
        \"ON\",\
        \"OPTIONAL\"\
      ]\
    },\
    \"UserPoolNameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\w\\\\s+=,.@-]+\"\
    },\
    \"UserPoolPolicyType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PasswordPolicy\":{\
          \"shape\":\"PasswordPolicyType\",\
          \"documentation\":\"<p>The password policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The policy associated with a user pool.</p>\"\
    },\
    \"UserPoolTaggingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"MessageType\"}\
      },\
      \"documentation\":\"<p>This exception is thrown when a user pool tag cannot be set or updated.</p>\",\
      \"exception\":true\
    },\
    \"UserPoolTagsListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKeysType\"}\
    },\
    \"UserPoolTagsType\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKeysType\"},\
      \"value\":{\"shape\":\"TagValueType\"}\
    },\
    \"UserPoolType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserPoolIdType\",\
          \"documentation\":\"<p>The ID of the user pool.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"UserPoolNameType\",\
          \"documentation\":\"<p>The name of the user pool.</p>\"\
        },\
        \"Policies\":{\
          \"shape\":\"UserPoolPolicyType\",\
          \"documentation\":\"<p>The policies associated with the user pool.</p>\"\
        },\
        \"LambdaConfig\":{\
          \"shape\":\"LambdaConfigType\",\
          \"documentation\":\"<p>The AWS Lambda triggers associated with the user pool.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StatusType\",\
          \"documentation\":\"<p>The status of a user pool.</p>\"\
        },\
        \"LastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user pool was last modified.</p>\"\
        },\
        \"CreationDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The date the user pool was created.</p>\"\
        },\
        \"SchemaAttributes\":{\
          \"shape\":\"SchemaAttributesListType\",\
          \"documentation\":\"<p>A container with the schema attributes of a user pool.</p>\"\
        },\
        \"AutoVerifiedAttributes\":{\
          \"shape\":\"VerifiedAttributesListType\",\
          \"documentation\":\"<p>Specifies the attributes that are auto-verified in a user pool.</p>\"\
        },\
        \"AliasAttributes\":{\
          \"shape\":\"AliasAttributesListType\",\
          \"documentation\":\"<p>Specifies the attributes that are aliased in a user pool.</p>\"\
        },\
        \"UsernameAttributes\":{\
          \"shape\":\"UsernameAttributesListType\",\
          \"documentation\":\"<p>Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up.</p>\"\
        },\
        \"SmsVerificationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the SMS verification message.</p>\"\
        },\
        \"EmailVerificationMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the email verification message.</p>\"\
        },\
        \"EmailVerificationSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>The subject of the email verification message.</p>\"\
        },\
        \"VerificationMessageTemplate\":{\
          \"shape\":\"VerificationMessageTemplateType\",\
          \"documentation\":\"<p>The template for verification messages.</p>\"\
        },\
        \"SmsAuthenticationMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The contents of the SMS authentication message.</p>\"\
        },\
        \"MfaConfiguration\":{\
          \"shape\":\"UserPoolMfaType\",\
          \"documentation\":\"<p>Can be one of the following values:</p> <ul> <li> <p> <code>OFF</code> - MFA tokens are not required and cannot be specified during user registration.</p> </li> <li> <p> <code>ON</code> - MFA tokens are required for all user registrations. You can only specify required when you are initially creating a user pool.</p> </li> <li> <p> <code>OPTIONAL</code> - Users have the option when registering to create an MFA token.</p> </li> </ul>\"\
        },\
        \"DeviceConfiguration\":{\
          \"shape\":\"DeviceConfigurationType\",\
          \"documentation\":\"<p>The device configuration.</p>\"\
        },\
        \"EstimatedNumberOfUsers\":{\
          \"shape\":\"IntegerType\",\
          \"documentation\":\"<p>A number estimating the size of the user pool.</p>\"\
        },\
        \"EmailConfiguration\":{\
          \"shape\":\"EmailConfigurationType\",\
          \"documentation\":\"<p>The email configuration.</p>\"\
        },\
        \"SmsConfiguration\":{\
          \"shape\":\"SmsConfigurationType\",\
          \"documentation\":\"<p>The SMS configuration.</p>\"\
        },\
        \"UserPoolTags\":{\
          \"shape\":\"UserPoolTagsType\",\
          \"documentation\":\"<p>The tags that are assigned to the user pool. A tag is a label that you can apply to user pools to categorize and manage them in different ways, such as by purpose, owner, environment, or other criteria.</p>\"\
        },\
        \"SmsConfigurationFailure\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The reason why the SMS configuration cannot send the messages to your users.</p>\"\
        },\
        \"EmailConfigurationFailure\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The reason why the email configuration cannot send the messages to your users.</p>\"\
        },\
        \"Domain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>Holds the domain prefix if the user pool has a domain associated with it.</p>\"\
        },\
        \"CustomDomain\":{\
          \"shape\":\"DomainType\",\
          \"documentation\":\"<p>A custom domain name that you provide to Amazon Cognito. This parameter applies only if you use a custom domain to host the sign-up and sign-in pages for your application. For example: <code>auth.example.com</code>.</p> <p>For more information about adding a custom domain to your user pool, see <a href=\\\"https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html\\\">Using Your Own Domain for the Hosted UI</a>.</p>\"\
        },\
        \"AdminCreateUserConfig\":{\
          \"shape\":\"AdminCreateUserConfigType\",\
          \"documentation\":\"<p>The configuration for <code>AdminCreateUser</code> requests.</p>\"\
        },\
        \"UserPoolAddOns\":{\
          \"shape\":\"UserPoolAddOnsType\",\
          \"documentation\":\"<p>The user pool add-ons.</p>\"\
        },\
        \"UsernameConfiguration\":{\
          \"shape\":\"UsernameConfigurationType\",\
          \"documentation\":\"<p>You can choose to enable case sensitivity on the username input for the selected sign-in option. For example, when this is set to <code>False</code>, users will be able to sign in using either \\\"username\\\" or \\\"Username\\\". This configuration is immutable once it has been set. For more information, see <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UsernameConfigurationType.html\\\">UsernameConfigurationType</a>.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ArnType\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the user pool.</p>\"\
        },\
        \"AccountRecoverySetting\":{\
          \"shape\":\"AccountRecoverySettingType\",\
          \"documentation\":\"<p>Use this setting to define which verified available method a user can use to recover their password when they call <code>ForgotPassword</code>. It allows you to define a preferred method when a user has more than one method available. With this setting, SMS does not qualify for a valid password recovery mechanism if the user also has SMS MFA enabled. In the absence of this setting, Cognito uses the legacy behavior to determine the recovery method where SMS is preferred over email.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A container for information about the user pool.</p>\"\
    },\
    \"UserStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNCONFIRMED\",\
        \"CONFIRMED\",\
        \"ARCHIVED\",\
        \"COMPROMISED\",\
        \"UNKNOWN\",\
        \"RESET_REQUIRED\",\
        \"FORCE_CHANGE_PASSWORD\"\
      ]\
    },\
    \"UserType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"UsernameType\",\
          \"documentation\":\"<p>The user name of the user you wish to describe.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"AttributeListType\",\
          \"documentation\":\"<p>A container with information about the user type attributes.</p>\"\
        },\
        \"UserCreateDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The creation date of the user.</p>\"\
        },\
        \"UserLastModifiedDate\":{\
          \"shape\":\"DateType\",\
          \"documentation\":\"<p>The last modified date of the user.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"BooleanType\",\
          \"documentation\":\"<p>Specifies whether the user is enabled.</p>\"\
        },\
        \"UserStatus\":{\
          \"shape\":\"UserStatusType\",\
          \"documentation\":\"<p>The user status. Can be one of the following:</p> <ul> <li> <p>UNCONFIRMED - User has been created but not confirmed.</p> </li> <li> <p>CONFIRMED - User has been confirmed.</p> </li> <li> <p>ARCHIVED - User is no longer active.</p> </li> <li> <p>COMPROMISED - User is disabled due to a potential security threat.</p> </li> <li> <p>UNKNOWN - User status is not known.</p> </li> <li> <p>RESET_REQUIRED - User is confirmed, but the user must request a code and reset his or her password before he or she can sign in.</p> </li> <li> <p>FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using a temporary password, but on first sign-in, the user must change his or her password to a new value before doing anything else. </p> </li> </ul>\"\
        },\
        \"MFAOptions\":{\
          \"shape\":\"MFAOptionListType\",\
          \"documentation\":\"<p>The MFA options for the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user type.</p>\"\
    },\
    \"UsernameAttributeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"phone_number\",\
        \"email\"\
      ]\
    },\
    \"UsernameAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UsernameAttributeType\"}\
    },\
    \"UsernameConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\"CaseSensitive\"],\
      \"members\":{\
        \"CaseSensitive\":{\
          \"shape\":\"WrappedBooleanType\",\
          \"documentation\":\"<p>Specifies whether username case sensitivity will be applied for all users in the user pool through Cognito APIs.</p> <p>Valid values include:</p> <ul> <li> <p> <b> <code>True</code> </b>: Enables case sensitivity for all username input. When this option is set to <code>True</code>, users must sign in using the exact capitalization of their given username. For example, âUserNameâ. This is the default value.</p> </li> <li> <p> <b> <code>False</code> </b>: Enables case insensitivity for all username input. For example, when this option is set to <code>False</code>, users will be able to sign in using either \\\"username\\\" or \\\"Username\\\". This option also enables both <code>preferred_username</code> and <code>email</code> alias to be case insensitive, in addition to the <code>username</code> attribute.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>The username configuration type. </p>\"\
    },\
    \"UsernameExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"MessageType\",\
          \"documentation\":\"<p>The message returned when Amazon Cognito throws a user name exists exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This exception is thrown when Amazon Cognito encounters a user name that already exists in the user pool.</p>\",\
      \"exception\":true\
    },\
    \"UsernameType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\p{L}\\\\p{M}\\\\p{S}\\\\p{N}\\\\p{P}]+\",\
      \"sensitive\":true\
    },\
    \"UsersListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserType\"}\
    },\
    \"VerificationMessageTemplateType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SmsMessage\":{\
          \"shape\":\"SmsVerificationMessageType\",\
          \"documentation\":\"<p>The SMS message template.</p>\"\
        },\
        \"EmailMessage\":{\
          \"shape\":\"EmailVerificationMessageType\",\
          \"documentation\":\"<p>The email message template.</p>\"\
        },\
        \"EmailSubject\":{\
          \"shape\":\"EmailVerificationSubjectType\",\
          \"documentation\":\"<p>The subject line for the email message template.</p>\"\
        },\
        \"EmailMessageByLink\":{\
          \"shape\":\"EmailVerificationMessageByLinkType\",\
          \"documentation\":\"<p>The email message template for sending a confirmation link to the user.</p>\"\
        },\
        \"EmailSubjectByLink\":{\
          \"shape\":\"EmailVerificationSubjectByLinkType\",\
          \"documentation\":\"<p>The subject line for the email message template for sending a confirmation link to the user.</p>\"\
        },\
        \"DefaultEmailOption\":{\
          \"shape\":\"DefaultEmailOptionType\",\
          \"documentation\":\"<p>The default email option.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The template for verification messages.</p>\"\
    },\
    \"VerifiedAttributeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"phone_number\",\
        \"email\"\
      ]\
    },\
    \"VerifiedAttributesListType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VerifiedAttributeType\"}\
    },\
    \"VerifySoftwareTokenRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UserCode\"],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>The access token.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service.</p>\"\
        },\
        \"UserCode\":{\
          \"shape\":\"SoftwareTokenMFAUserCodeType\",\
          \"documentation\":\"<p>The one time password computed using the secret code returned by <a href=\\\"https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AssociateSoftwareToken.html\\\">AssociateSoftwareToken\\\"</a>.</p>\"\
        },\
        \"FriendlyDeviceName\":{\
          \"shape\":\"StringType\",\
          \"documentation\":\"<p>The friendly device name.</p>\"\
        }\
      }\
    },\
    \"VerifySoftwareTokenResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VerifySoftwareTokenResponseType\",\
          \"documentation\":\"<p>The status of the verify software token.</p>\"\
        },\
        \"Session\":{\
          \"shape\":\"SessionType\",\
          \"documentation\":\"<p>The session which should be passed both ways in challenge-response calls to the service.</p>\"\
        }\
      }\
    },\
    \"VerifySoftwareTokenResponseType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUCCESS\",\
        \"ERROR\"\
      ]\
    },\
    \"VerifyUserAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AccessToken\",\
        \"AttributeName\",\
        \"Code\"\
      ],\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"TokenModelType\",\
          \"documentation\":\"<p>Represents the access token of the request to verify user attributes.</p>\"\
        },\
        \"AttributeName\":{\
          \"shape\":\"AttributeNameType\",\
          \"documentation\":\"<p>The attribute name in the request to verify user attributes.</p>\"\
        },\
        \"Code\":{\
          \"shape\":\"ConfirmationCodeType\",\
          \"documentation\":\"<p>The verification code in the request to verify user attributes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the request to verify user attributes.</p>\"\
    },\
    \"VerifyUserAttributeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A container representing the response from the server from the request to verify user attributes.</p>\"\
    },\
    \"WrappedBooleanType\":{\"type\":\"boolean\"}\
  },\
  \"documentation\":\"<p>Using the Amazon Cognito User Pools API, you can create a user pool to manage directories and users. You can authenticate a user to obtain tokens related to user identity and access policies.</p> <p>This API reference provides information about user pools in Amazon Cognito User Pools.</p> <p>For more information, see the Amazon Cognito Documentation.</p>\"\
}\
";
}

@end
