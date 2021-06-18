import qurSql from './con2sql.js';


var getCardCount = function(){
    let sqluser = {
        username:'akarichan',
        userpasswd:'akariChan@0721',
        database:'umamusume-pbl'
    }
    //返回值为各卡的名字以及数量
    let getCardCountQuery = 'SELECT\
    supportcard.id,tmptable_2.atb_count,CONCAT(supportcard.spc_name,'-',supportcard.spc_secname) AS thespc_name \
    FROM(\
    SELECT id, SUM(`count`) AS atb_count\
    FROM(\
    SELECT supportcard.`id`, COUNT(supportcard.`id`) AS `count`\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id`=umasingle.`uma_sc1`\
    GROUP BY supportcard.`id`\
    UNION ALL SELECT supportcard.`id`, COUNT(supportcard.`id`) AS `count`\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id`=umasingle.`uma_sc2`\
    GROUP BY supportcard.`id`\
    UNION ALL SELECT supportcard.`id`, COUNT(supportcard.`id`) AS `count`\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id`=umasingle.`uma_sc3`\
    GROUP BY supportcard.`id`\
    UNION ALL SELECT supportcard.`id`, COUNT(supportcard.`id`) AS `count`\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id`=umasingle.`uma_sc4`\
    GROUP BY supportcard.`id`\
    UNION ALL SELECT supportcard.`id`, COUNT(supportcard.`id`) AS `count`\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id`=umasingle.`uma_sc5`\
    GROUP BY supportcard.`id`\
    UNION ALL SELECT supportcard.`id`, COUNT(supportcard.`id`) AS `count`\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id`=umasingle.`uma_sc6`\
    GROUP BY supportcard.`id`\
    ) AS countTable\
    GROUP BY id\
    ) AS tmptable_2\
    LEFT JOIN supportcard ON supportcard.`id`=tmptable_2.id'

    //返回值为各属性量
    let getAtbCountQuery='\
    SELECT tmptable.spc_attribute , SUM(tmptable.atbc) AS spc_attribute_sum\
    FROM(\
    SELECT supportcard.spc_attribute , COUNT(supportcard.spc_attribute) AS atbc\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id` = umasingle.`uma_sc1` \
    GROUP BY supportcard.spc_attribute\
    UNION ALL SELECT supportcard.spc_attribute , COUNT(supportcard.spc_attribute) AS atbc\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id` = umasingle.`uma_sc2`\
    GROUP BY supportcard.spc_attribute\
    UNION ALL SELECT supportcard.spc_attribute , COUNT(supportcard.spc_attribute) AS atbc\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id` = umasingle.`uma_sc3`\
    GROUP BY supportcard.spc_attribute\
    UNION ALL SELECT supportcard.spc_attribute , COUNT(supportcard.spc_attribute) AS atbc\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id` = umasingle.`uma_sc4` \
    GROUP BY supportcard.spc_attribute\
    UNION ALL SELECT supportcard.spc_attribute , COUNT(supportcard.spc_attribute) AS atbc\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id` = umasingle.`uma_sc5` \
    GROUP BY supportcard.spc_attribute\
    UNION ALL SELECT supportcard.spc_attribute , COUNT(supportcard.spc_attribute) AS atbc\
    FROM umasingle\
    LEFT JOIN supportcard ON supportcard.`id` = umasingle.`uma_sc6` \
    GROUP BY supportcard.spc_attribute\
    ) AS tmptable\
    GROUP BY tmptable.spc_attribute'
}