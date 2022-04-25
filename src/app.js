/*! Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *  SPDX-License-Identifier: MIT-0
 */


exports.handler = async (event, context) => {
  console.info("EVENT\n" + JSON.stringify(event, null, 2))
  var response = {
    statusCode: 200,
   
    body: event.body,
  }

  return response
}
