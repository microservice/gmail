# _Gmail_ Open Microservice

> This is a gmail service.

[![Open Microservice Specification Version](https://img.shields.io/badge/Open%20Microservice-1.0-477bf3.svg)](https://openmicroservices.org) [![Open Microservices Spectrum Chat](https://withspectrum.github.io/badge/badge.svg)](https://spectrum.chat/open-microservices) [![Open Microservices Code of Conduct](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](https://github.com/oms-services/.github/blob/master/CODE_OF_CONDUCT.md) [![Open Microservices Commitzen](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com) 
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Introduction

This project is an example implementation of the [Open Microservice Specification](https://openmicroservices.org), a standard originally created at [Storyscript](https://storyscript.io) for building highly-portable "microservices" that expose the events, actions, and APIs inside containerized software.

## Getting Started

The `oms` command-line interface allows you to interact with Open Microservices. If you're interested in creating an Open Microservice the CLI also helps validate, test, and debug your `oms.yml` implementation!

See the [oms-cli](https://github.com/microservices/oms) project to learn more!

### Installation

```
npm install -g @microservices/oms
```

## Usage

### Open Microservices CLI Usage

Once you have the [oms-cli](https://github.com/microservices/oms) installed, you can run any of the following commands from within this project's root directory:

#### Actions

##### authorization

> This will return URL, copy paste URL on browser and get authorization code.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| scope | `string` | `true` | None | The scope to access user data (eg-"https://mail.google.com/") |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run authorization \ 
    -a scope='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### accessToken

> Return token object with access token, refresh token , token type and expiry.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| authorizationCode | `string` | `true` | None | The authorizationCode code. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run accessToken \ 
    -a authorizationCode='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### refreshToken

> Return new token object with access token, refresh token ,token type and expiry.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| token | `map` | `true` | None | The old token object with access token, refresh token ,token type and expiry, all the fields are mandatory. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run refreshToken \ 
    -a token='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### sendMail

> Send mail.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The sender email address. |
| to | `list` | `true` | None | The list of receiver's email address. |
| subject | `string` | `true` | None | The subject to the mail. |
| body | `string` | `true` | None | The message body of mail. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run sendMail \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -a to='*****' \ 
    -a subject='*****' \ 
    -a body='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### createLabel

> Create new label, they are used to categorize messages and threads within the user's mailbox.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The email address of account holder. |
| name | `string` | `true` | None | The name for new label. |
| backgroundColor | `string` | `false` | None | The background color represented as hex string "#RRGGBB" (ex "#000000"). This field is required in order to set the color of a label. Only the following predefined set of color values are allowed- "#000000", "#434343", "#666666", "#999999", "#cccccc", "#efefef", "#f3f3f3", "#ffffff", "#fb4c2f", "#ffad47", "#fad165", "#16a766", "#43d692", "#4a86e8", "#a479e2", "#f691b3", "#f6c5be", "#ffe6c7", "#fef1d1", "#b9e4d0", "#c6f3de", "#c9daf8", "#e4d7f5", "#fcdee8", "#efa093", "#ffd6a2", "#fce8b3", "#89d3b2", "#a0eac9", "#a4c2f4", "#d0bcf1", "#fbc8d9", "#e66550", "#ffbc6b", "#fcda83", "#44b984", "#68dfa9", "#6d9eeb", "#b694e8", "#f7a7c0", "#cc3a21", "#eaa041", "#f2c960", "#149e60", "#3dc789", "#3c78d8", "#8e63ce", "#e07798", "#ac2b16", "#cf8933", "#d5ae49", "#0b804b", "#2a9c68", "#285bac", "#653e9b", "#b65775", "#822111", "#a46a21", "#aa8831", "#076239", "#1a764d", "#1c4587", "#41236d", "#83334c"  |
| textColor | `string` | `false` | None | The text color of the label, represented as hex string. This field is required in order to set the color of a label. Only the following predefined set of color values are allowed - "#000000", "#434343", "#666666", "#999999", "#cccccc", "#efefef", "#f3f3f3", "#ffffff", "#fb4c2f", "#ffad47", "#fad165", "#16a766", "#43d692", "#4a86e8", "#a479e2", "#f691b3", "#f6c5be", "#ffe6c7", "#fef1d1", "#b9e4d0", "#c6f3de", "#c9daf8", "#e4d7f5", "#fcdee8", "#efa093", "#ffd6a2", "#fce8b3", "#89d3b2", "#a0eac9", "#a4c2f4", "#d0bcf1", "#fbc8d9", "#e66550", "#ffbc6b", "#fcda83", "#44b984", "#68dfa9", "#6d9eeb", "#b694e8", "#f7a7c0", "#cc3a21", "#eaa041", "#f2c960", "#149e60", "#3dc789", "#3c78d8", "#8e63ce", "#e07798", "#ac2b16", "#cf8933", "#d5ae49", "#0b804b", "#2a9c68", "#285bac", "#653e9b", "#b65775", "#822111", "#a46a21", "#aa8831", "#076239", "#1a764d", "#1c4587", "#41236d", "#83334c"  |
| labelListVisibility | `string` | `false` | None | The visibility of the label in the label list in the Gmail web interface.Possible values are "labelHide", "labelShow", "labelShowIfUnread". |
| messageListVisibility | `string` | `false` | None | The visibility of the label in the message list in the Gmail web interface.Possible values "hide" and "show". |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run createLabel \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -a name='*****' \ 
    -a backgroundColor='*****' \ 
    -a textColor='*****' \ 
    -a labelListVisibility='*****' \ 
    -a messageListVisibility='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### deleteLabel

> Immediately and permanently deletes the specified label and removes it from any messages and threads that it is applied to.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The email address of account holder. |
| labelId | `string` | `true` | None | The label ID to delete. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run deleteLabel \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -a labelId='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### patchLabel

> Updates the specified label. This method supports patch semantics.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The email address of account holder. |
| labelId | `string` | `true` | None | The label ID to update. |
| name | `string` | `false` | None | The name for new label. |
| backgroundColor | `string` | `false` | None | The background color represented as hex string "#RRGGBB" (ex "#000000"). This field is required in order to set the color of a label. Only the following predefined set of color values are allowed- "#000000", "#434343", "#666666", "#999999", "#cccccc", "#efefef", "#f3f3f3", "#ffffff", "#fb4c2f", "#ffad47", "#fad165", "#16a766", "#43d692", "#4a86e8", "#a479e2", "#f691b3", "#f6c5be", "#ffe6c7", "#fef1d1", "#b9e4d0", "#c6f3de", "#c9daf8", "#e4d7f5", "#fcdee8", "#efa093", "#ffd6a2", "#fce8b3", "#89d3b2", "#a0eac9", "#a4c2f4", "#d0bcf1", "#fbc8d9", "#e66550", "#ffbc6b", "#fcda83", "#44b984", "#68dfa9", "#6d9eeb", "#b694e8", "#f7a7c0", "#cc3a21", "#eaa041", "#f2c960", "#149e60", "#3dc789", "#3c78d8", "#8e63ce", "#e07798", "#ac2b16", "#cf8933", "#d5ae49", "#0b804b", "#2a9c68", "#285bac", "#653e9b", "#b65775", "#822111", "#a46a21", "#aa8831", "#076239", "#1a764d", "#1c4587", "#41236d", "#83334c"  |
| textColor | `string` | `false` | None | The text color of the label, represented as hex string (ex "#000000"). This field is required in order to set the color of a label. Only the following predefined set of color values are allowed - "#000000", "#434343", "#666666", "#999999", "#cccccc", "#efefef", "#f3f3f3", "#ffffff", "#fb4c2f", "#ffad47", "#fad165", "#16a766", "#43d692", "#4a86e8", "#a479e2", "#f691b3", "#f6c5be", "#ffe6c7", "#fef1d1", "#b9e4d0", "#c6f3de", "#c9daf8", "#e4d7f5", "#fcdee8", "#efa093", "#ffd6a2", "#fce8b3", "#89d3b2", "#a0eac9", "#a4c2f4", "#d0bcf1", "#fbc8d9", "#e66550", "#ffbc6b", "#fcda83", "#44b984", "#68dfa9", "#6d9eeb", "#b694e8", "#f7a7c0", "#cc3a21", "#eaa041", "#f2c960", "#149e60", "#3dc789", "#3c78d8", "#8e63ce", "#e07798", "#ac2b16", "#cf8933", "#d5ae49", "#0b804b", "#2a9c68", "#285bac", "#653e9b", "#b65775", "#822111", "#a46a21", "#aa8831", "#076239", "#1a764d", "#1c4587", "#41236d", "#83334c"  |
| labelListVisibility | `string` | `false` | None | The visibility of the label in the label list in the Gmail web interface.Possible values are "labelHide", "labelShow", "labelShowIfUnread". |
| messageListVisibility | `string` | `false` | None | The visibility of the label in the message list in the Gmail web interface.Possible values "hide" and "show". |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run patchLabel \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -a labelId='*****' \ 
    -a name='*****' \ 
    -a backgroundColor='*****' \ 
    -a textColor='*****' \ 
    -a labelListVisibility='*****' \ 
    -a messageListVisibility='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### labelList

> Lists all labels from user's mailbox.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The email address of account holder. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run labelList \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### createFilter

> Creates a filter.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The email address of account holder. |
| addLabelId | `string` | `false` | None | The label to add to the message. |
| removeLabelId | `string` | `false` | None | The label to remove from the message. |
| excludeChats | `boolean` | `false` | None | Whether the response should exclude chats. |
| from | `string` | `true` | None | The sender's email address. |
| to | `string` | `false` | None | The recipient's display name or email address. Includes recipients in the "to", "cc", and "bcc" header fields. You can use simply the local part of the email address. For example, "example" and "example@" both match "example@gmail.com". This field is case-insensitive. |
| subject | `string` | `false` | None | Case-insensitive phrase found in the message's subject. Trailing and leading whitespace are be trimmed and adjacent spaces are collapsed. |
| hasAttachment | `boolean` | `false` | None | Whether the message has any attachment. |
| negatedQuery | `string` | `false` | None | Only return messages not matching the specified query. Supports the same query format as the Gmail search box. |
| query | `string` | `false` | None | Only return messages matching the specified query. Supports the same query format as the Gmail search box. |
| size | `int` | `false` | None | The size of the entire RFC822 message in bytes, including all headers and attachments. |
| sizeComparison | `string` | `false` | None | How the message size in bytes should be in relation to the size field. Acceptable values are "larger", "smaller" and "unspecified" |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run createFilter \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -a addLabelId='*****' \ 
    -a removeLabelId='*****' \ 
    -a excludeChats='*****' \ 
    -a from='*****' \ 
    -a to='*****' \ 
    -a subject='*****' \ 
    -a hasAttachment='*****' \ 
    -a negatedQuery='*****' \ 
    -a query='*****' \ 
    -a size='*****' \ 
    -a sizeComparison='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### deleteFilter

> Delete a filter.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The email address of account holder. |
| filterId | `string` | `false` | None | The filter ID to delete. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run deleteFilter \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -a filterId='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### filterList

> List all the filter from setting.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| accessToken | `string` | `true` | None | The access token. |
| userId | `string` | `true` | None | The email address of account holder. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms run filterList \ 
    -a accessToken='*****' \ 
    -a userId='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

##### mail

> Triggered anytime when any new email is occurred in mail inbox.
##### Action Arguments

| Argument Name | Type | Required | Default | Description |
|:------------- |:---- |:-------- |:--------|:----------- |
| userId | `string` | `true` | None | The receiver account email address. |
| accessToken | `string` | `true` | None | The access token to use gmail API. |
| CREDENTIAL_JSON | `string` | `true` | None | Base64 data of credential.json' file. |

``` shell
oms subscribe mail \ 
    -a userId='*****' \ 
    -a accessToken='*****' \ 
    -e CREDENTIAL_JSON=$CREDENTIAL_JSON
```

## Contributing

All suggestions in how to improve the specification and this guide are very welcome. Feel free share your thoughts in the Issue tracker, or even better, fork the repository to implement your own ideas and submit a pull request.

[![Edit gmail on CodeSandbox](https://codesandbox.io/static/img/play-codesandbox.svg)](https://codesandbox.io/s/github/oms-services/gmail)

This project is guided by [Contributor Covenant](https://github.com/oms-services/.github/blob/master/CODE_OF_CONDUCT.md). Please read out full [Contribution Guidelines](https://github.com/oms-services/.github/blob/master/CONTRIBUTING.md).

## Additional Resources

* [Install the CLI](https://github.com/microservices/oms) - The OMS CLI helps developers create, test, validate, and build microservices.
* [Example OMS Services](https://github.com/oms-services) - Examples of OMS-compliant services written in a variety of languages.
* [Example Language Implementations](https://github.com/microservices) - Find tooling & language implementations in Node, Python, Scala, Java, Clojure.
* [Storyscript Hub](https://hub.storyscript.io) - A public registry of OMS services.
* [Community Chat](https://spectrum.chat/open-microservices) - Have ideas? Questions? Join us on Spectrum.
