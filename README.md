# _Gmail_ OMS Microservice

[![Open Microservice Guide](https://img.shields.io/badge/OMS%20Enabled-👍-green.svg?)](https://microservice.guide)
[![Build Status](https://travis-ci.com/oms-services/gmail.svg?branch=master)](https://travis-ci.com/oms-services/gmail)
[![codecov](https://codecov.io/gh/oms-services/gmail/branch/master/graph/badge.svg)](https://codecov.io/gh/oms-services/gmail)

An OMS service for Gmail, this service uses the gmail API and perform gmail operations.

## Usage with [OMS CLI](https://www.npmjs.com/package/@microservices/oms)

##### Authorization
```shell
oms run authorization -a scope=<OPERATION_SCOPE> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Access Token
```shell
$ oms run accessToken -a authorizationCode=<AUTHORIZATION_CODE> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Refresh Token
```shell
$ oms run refreshToken -a token=<TOKEN_MAPPED_OBJECT> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Send Mail
```shell
$ oms run sendMail -a accessToken=<ACCESS_TOKEN> -a userId=<SENDER_EMAIL_ADDRESS> -a to=[LIST_OF_RECEIVER_EMAIL_ADDRESS] -a subject=<MAIL_SUBJECT> -a body=<MESSAGE_BODY> -a accessToken=<ACCESS_TOKEN> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Create Label
```shell
oms run createLabel -a accessToken=<ACCESS_TOKEN> -a userId=<EMAIL_ADDRESS> -a name=<LABEL_NAME> -a backgroundColor=<Label_BACKGROUND_COLOR> -a textColor=<Label_TEXT_COLOR> -a labelListVisibility=<LABEL_LIST_VISIBILITY> -a messageListVisibility=<MESSAGE_LIST_VISIBILITY> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Delete Label:
```shell
oms run deleteLabel -a accessToken=<ACCESS_TOKEN> -a userId=<EMAIL_ADDRESS> -a labelId=<LABEL_ID> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Patch Label:
```shell
oms run patchLabel -a accessToken=<ACCESS_TOKEN> -a userId=<EMAIL_ADDRESS> -a labelId=<LABEL_ID> -a name=<LABEL_NAME> -a backgroundColor=<Label_BACKGROUND_COLOR> -a textColor=<Label_TEXT_COLOR> -a labelListVisibility=<LABEL_LIST_VISIBILITY> -a messageListVisibility=<MESSAGE_LIST_VISIBILITY> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### List Label
```shell
oms run labelList -a accessToken=<ACCESS_TOKEN> -a userId=<EMAIL_ADDRESS> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Create Filter
```shell
oms run createFilter -a accessToken=<ACCESS_TOKEN> -a userId=<EMAIL_ADDRESS> -a addLabelId=<ADD_LABEL_ID> -a removeLabelId=<REMOVE_LABEL_ID> -a excludeChats=<EXCLUDE_CHATS> -a from=<SENDER_EMAIl_ADDRESS> -a to=<RECEIVER_EMAIL_ADDRESS> -a subject=<MAIL_SUBJECT> -a hasAttachment=<HAS_ATTACHMENT> -a negatedQuery=<NEGATED_QUERY> -a query=<QUERY> -a size=<SIZE_OF_MESSAGE> -a sizeComparison=<SIZE_COMPARISON> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Delete Filter
```shell
oms run deleteFilter -a accessToken=<ACCESS_TOKEN> -a userId=<EMAIL_ADDRESS> -a filterId=<FILTER_ID> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### List Filter
```shell
oms run filterList -a accessToken=<ACCESS_TOKEN> -a userId=<EMAIL_ADDRESS> -e CREDENTIAL_JSON=<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```
##### Receive Mail
```shell
$ oms run subscribe receive mail -a userId=<EMAIL_ADDRESS> -a accessToken=<ACCESS_TOKEN> -e CREDENTIAL_JSON==<BASE64_DATA_OF_CREDENTIAL_JSON_FILE>
```

**Note**: the OMS CLI requires [Docker](https://docs.docker.com/install/) to be installed.

## License
[MIT License](https://github.com/oms-services/gmail/blob/master/LICENSE).
