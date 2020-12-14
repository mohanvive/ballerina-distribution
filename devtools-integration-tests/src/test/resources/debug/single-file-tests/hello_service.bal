// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/test;

service on new http:Listener(9090) {
    resource function get sayHello(http:Caller caller,
        http:Request req) returns error? {
            check caller->respond("Hello, World!");
    }
}

# Test function
@test:Config{}
function testServiceFunction ()  {
    http:Client httpClient = new("http://localhost:9090");
    var response = httpClient->get("/sayHello");
    if (response is http:Response) {
        test:assertEquals(response.getTextPayload(), "Hello, World!", "Service involation test");
    } else {
        test:assertFail(response.toString());
    }
}