<!--
 * @Author: your name
 * @Date: 2021-07-26 20:07:01
 * @LastEditTime: 2021-08-13 00:55:51
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \MyNotef:\My Repo\umamusume-calc\src\components\InsertData2DB.vue
-->
<template>
    <div>
        <!-- Form -->
        <el-button type="text" @click="dialogFormVisible_Spc = true">插入支援卡</el-button>
        <el-button type="text" @click="dialogFormVisible_Uma = true">插入🐎</el-button>
        <el-table :data="allCard" stripe border style="width: 100%" height="600">
            <el-table-column prop="spc_name" label="name" width="180">
            </el-table-column>
            <el-table-column prop="spc_secname" label="secname" width="180">
            </el-table-column>
            <el-table-column prop="spc_rare" label="rare" width="50">
            </el-table-column>
            <el-table-column prop="spc_attribute" label="atb" width="50">
            </el-table-column>
            <el-table-column prop="spc_img" label="atb" width="500">
            </el-table-column>
            <el-table-column prop="spc_icon" label="atb" width="500">
            </el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
                <template slot-scope="scope">
                    <el-button @click="syncCard(scope.row)" type="text" size="small">更改</el-button>
                    </el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-table :data="allUma" stripe border style="width: 100%" height="600">
            <el-table-column prop="uma_name" label="name" width="180">
            </el-table-column>
            <el-table-column prop="uma_secname" label="secname" width="180">
            </el-table-column>
            <el-table-column prop="uma_icon" label="icon_url" width="500">
            </el-table-column>
            <el-table-column prop="uma_img" label="img_url" width="500">
            </el-table-column>
            <el-table-column fixed="right" label="操作" width="100">
                <template slot-scope="scope">
                    <el-button @click="syncUma(scope.row)" type="text" size="small">更改</el-button>
                    </el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog title="INSERT CARD" :visible.sync="dialogFormVisible_Spc">
            <el-form :model="card" :inline="true">
                <el-form-item label="名前" :label-width="formLabelWidth">
                    <el-input v-model="card.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="二つ名" :label-width="formLabelWidth">
                    <el-input v-model="card.secname" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="タイプ" :label-width="formLabelWidth">
                    <el-select v-model="card.atb" placeholder="タイプ">
                        <el-option label="スビート" value="1"></el-option>
                        <el-option label="スタミナ" value="2"></el-option>
                        <el-option label="パワー" value="3"></el-option>
                        <el-option label="根性" value="4"></el-option>
                        <el-option label="賢さ" value="5"></el-option>
                        <el-option label="友人" value="6"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="レア度" :label-width="formLabelWidth">
                    <el-select v-model="card.rare" placeholder="レア度">
                        <el-option label="SSR" value="3"></el-option>
                        <el-option label="SR" value="2"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="IMGURL" :label-width="formLabelWidth">
                    <el-input v-model="card.imgurl" placeholder="图片链接(gamewith)">
                        <el-option label="SSR" value="3"></el-option>
                        <el-option label="SR" value="2"></el-option>
                    </el-input>
                </el-form-item>
                <el-form-item label="ICONURL" :label-width="formLabelWidth">
                    <el-input v-model="card.iconurl" placeholder="图标链接(gamewith)">
                        <el-option label="SSR" value="3"></el-option>
                        <el-option label="SR" value="2"></el-option>
                    </el-input>
                </el-form-item>
                <div class="pictrue">
                    <img style="width:300px;margin:20px"
                        :src="card.imgurl==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':card.imgurl"
                        alt="">
                    <img style="width:300px;margin:20px"
                        :src="card.iconurl==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':card.iconurl"
                        alt="">
                </div>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible_Spc = false">取 消</el-button>
                <el-button type="primary" @click="insertSupportCard();dialogFormVisible_Spc = false">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog titel="UPDATE CARD" :visible.sync="dialogFormVisible_Spc_U">
            <el-form :model="card2Update" :inline="true">
                <el-form-item label="名前" :label-width="formLabelWidth">
                    <el-input v-model="card2Update.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="二つ名" :label-width="formLabelWidth">
                    <el-input v-model="card2Update.secname" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="タイプ" :label-width="formLabelWidth">
                    <el-select v-model="card2Update.atb" placeholder="タイプ">
                        <el-option label="スビート" value="1"></el-option>
                        <el-option label="スタミナ" value="2"></el-option>
                        <el-option label="パワー" value="3"></el-option>
                        <el-option label="根性" value="4"></el-option>
                        <el-option label="賢さ" value="5"></el-option>
                        <el-option label="友人" value="6"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="レア度" :label-width="formLabelWidth">
                    <el-select v-model="card2Update.rare" placeholder="レア度">
                        <el-option label="SSR" value="3"></el-option>
                        <el-option label="SR" value="2"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="IMGURL" :label-width="formLabelWidth">
                    <el-input v-model="card2Update.imgurl" placeholder="图片链接(gamewith)">
                        <el-option label="SSR" value="3"></el-option>
                        <el-option label="SR" value="2"></el-option>
                    </el-input>
                </el-form-item>
                <el-form-item label="ICONURL" :label-width="formLabelWidth">
                    <el-input v-model="card2Update.iconurl" placeholder="图标链接(gamewith)">
                        <el-option label="SSR" value="3"></el-option>
                        <el-option label="SR" value="2"></el-option>
                    </el-input>
                </el-form-item>
                <div class="pictrue">
                    <img style="width:300px;margin:20px"
                        :src="card2Update.imgurl==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':card2Update.imgurl"
                        alt="">
                    <img style="width:300px;margin:20px"
                        :src="card2Update.iconurl==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':card2Update.iconurl"
                        alt="">
                </div>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible_Spc_U = false">取 消</el-button>
                <el-button type="primary" @click="updateCard();dialogFormVisible_Spc_U = false">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog title="INSERT UMA" :visible.sync="dialogFormVisible_Uma">
            <el-form :model="uma" :inline="true">
                <el-form-item label="名前" :label-width="formLabelWidth">
                    <el-input v-model="uma.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="二つ名" :label-width="formLabelWidth">
                    <el-input v-model="uma.secname" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="IMGURL" :label-width="formLabelWidth">
                    <el-input v-model="uma.img" placeholder="图片链接(gamewith)">
                    </el-input>
                </el-form-item>
                <el-form-item label="ICONURL" :label-width="formLabelWidth">
                    <el-input v-model="uma.icon" placeholder="头像链接(gamewith)">
                    </el-input>
                </el-form-item>
                <div class="pictrue">
                    <img style="width:300px;margin:20px"
                        :src="uma.img==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':uma.img"
                        alt="">
                    <img style="width:300px;margin:20px"
                        :src="uma.icon==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':uma.icon"
                        alt="">
                </div>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible_Uma = false">取 消</el-button>
                <el-button type="primary" @click="insertUma();dialogFormVisible_Uma = false">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog title="UPDATE UMA" :visible.sync="dialogFormVisible_Uma_U">
            <el-form :model="uma2Update" :inline="true">
                <el-form-item label="名前" :label-width="formLabelWidth">
                    <el-input v-model="uma2Update.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="二つ名" :label-width="formLabelWidth">
                    <el-input v-model="uma2Update.secname" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="IMGURL" :label-width="formLabelWidth">
                    <el-input v-model="uma2Update.imgurl" placeholder="图片链接(gamewith)">
                    </el-input>
                </el-form-item>
                <el-form-item label="ICONURL" :label-width="formLabelWidth">
                    <el-input v-model="uma2Update.iconurl" placeholder="头像链接(gamewith)">
                    </el-input>
                </el-form-item>
                <div class="pictrue">
                    <img style="width:300px;margin:20px"
                        :src="uma2Update.imgurl==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':uma2Update.imgurl"
                        alt="">
                    <img style="width:300px;margin:20px"
                        :src="uma2Update.iconurl==''?'https://home.akarichan.us:10034/images/2021/02/10/sekai2-24.jpg':uma2Update.iconurl"
                        alt="">
                </div>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible_Uma_U = false">取 消</el-button>
                <el-button type="primary" @click="updateUma();dialogFormVisible_Uma_U = false">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
    import {
        qurSql
    } from '../jsfile/api/con2sql.js'

    export default {
        name: 'InsertData2DB',
        data() {
            return {
                formLabelWidth: '60',
                dialogFormVisible_Spc: false,
                dialogFormVisible_Spc_U: false,
                dialogFormVisible_Uma: false,
                dialogFormVisible_Uma_U: false,
                card: {
                    name: '',
                    secname: '',
                    atb: '',
                    rare: '',
                    imgurl: '',
                    iconurl: '',
                },
                uma: {
                    name: '',
                    secname: '',
                    img: '',
                    icon: '',
                },
                sqlcon: {
                    username: 'akarichan',
                    userpasswd: 'akariChan@0721',
                    database: 'umamusume-pbl',
                },
                allCard: [],
                allUma:[],
                card2Update: '',
                uma2Update: '',
            }
        },
        methods: {
            insertUma() {
                let query =
                    `INSERT INTO uma (uma_name, uma_secname, uma_img, uma_icon) VALUES ('${this.uma.name}', '${this.uma.secname}', '${this.uma.img}', '${this.uma.icon}')`
                qurSql(this.sqlcon, query, res => {
                    console.log(res)
                    let msg = `插入成功, 影响行数:  + ${res.affectedRows}, msg=${res.message}`
                    this.callOutMsg('success', msg)
                })
            },
            insertSupportCard() {
                let query =
                    `INSERT INTO supportcard (spc_attribute, spc_name, spc_secname, spc_rare, spc_img, spc_icon) 
                        VALUES 
                        (${this.card.atb} ,'${this.card.name}', '${this.card.secname}', ${this.card.rare}, '${this.card.imgurl}', '${this.card.iconurl}')`
                qurSql(this.sqlcon, query, res => {
                    console.log(res)
                    let msg = `插入成功, 影响行数:  + ${res.affectedRows}, msg=${res.message}`
                    this.callOutMsg('success', msg)
                })
            },
            callOutMsg(type, data) {
                this.$message({
                    showClose: true,
                    center: true,
                    message: data,
                    type: type
                });
            },
            syncCard(card) {
                this.card2Update = {
                    id: card.id,
                    name: card.spc_name,
                    secname: card.spc_secname,
                    atb: card.spc_attribute,
                    rare: card.spc_rare,
                    imgurl: card.spc_img,
                    iconurl: card.spc_icon,
                }
                this.dialogFormVisible_Spc_U = true
            },
            syncUma(uma) {
                this.uma2Update = {
                    id: uma.id,
                    name: uma.uma_name,
                    secname: uma.uma_secname,
                    imgurl: uma.uma_img,
                    iconurl: uma.uma_icon
                }
                this.dialogFormVisible_Uma_U = true
            },
            updateCard() {
                let query = `UPDATE supportcard 
                            SET spc_attribute=${this.card2Update.atb}, spc_name='${this.card2Update.name}', spc_secname='${this.card2Update.secname}', spc_rare=${this.card2Update.rare}, spc_img='${this.card2Update.imgurl}', spc_icon='${this.card2Update.iconurl}'
                            WHERE id=${this.card2Update.id}`
                console.log(query)
                qurSql(this.sqlcon, query, res => {
                    console.log(res)
                    let msg = `插入成功, 影响行数:  + ${res.affectedRows}, msg=${res.message}`
                    this.callOutMsg('success', msg)
                })
                qurSql(undefined, `select * from supportcard`, res => {
                    this.allCard = res;
                })
            },
            updateUma(){
                let query = `UPDATE uma 
                            SET uma_name='${this.uma2Update.name}', uma_secname='${this.uma2Update.secname}', uma_icon='${this.uma2Update.iconurl}', uma_img='${this.uma2Update.imgurl}'
                            WHERE id=${this.uma2Update.id}`
                console.log(query)
                qurSql(this.sqlcon, query, res => {
                    console.log(res)
                    let msg = `插入成功, 影响行数:  + ${res.affectedRows}, msg=${res.message}`
                    this.callOutMsg('success', msg)
                })
                qurSql(undefined, `select * from uma`, res => {
                    this.allUma = res;
                })
            }
        },
        mounted() {
            qurSql(undefined, `select * from supportcard`, res => {
                this.allCard = res;
            })
            qurSql(undefined, `select * from uma`, res=>{
                this.allUma = res
            })
        }
    }
</script>