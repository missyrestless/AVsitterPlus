/*
 * AVP_root - Activate setups in child prims by touching the root
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Copyright © the AVsitter Contributors (http://avsitter.github.io)
 * Copyright © Truth & Beauty Lab (https://avsitterplus.github.io)
 *
 * Please consider supporting continued development of AVsitterPlus and
 * receive automatic updates and other benefits! All details and user
 * instructions can be found at https://avsitterplus.github.io
 */
//string version = "2.3.1";
string script_basename = "AVP_sitA";
string menu_script = "AVP_menu";
key A;
list B = [A]; //OSS::list B; // Force error in LSO

default
{
    touch_end(integer touched)
    {
        if (llGetInventoryType(script_basename) != INVENTORY_SCRIPT && llGetInventoryType(menu_script) != INVENTORY_SCRIPT)
        {
            llMessageLinked(LINK_ALL_OTHERS, 90005, llList2String(B, 0), llDetectedKey(0));
            B = [];
        }
    }
}
