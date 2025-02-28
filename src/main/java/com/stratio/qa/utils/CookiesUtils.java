/*
 * Copyright (C) 2014 Stratio (http://stratio.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.stratio.qa.utils;

import io.netty.handler.codec.http.cookie.Cookie;

import java.util.ArrayList;
import java.util.List;

public class CookiesUtils {

    private static List<Cookie> cookies = new ArrayList<>();

    public static List<Cookie> getCookies() {
        return cookies;
    }

    public static void setCookies(List<Cookie> newCookies) {
        cookies = newCookies;
    }
}
