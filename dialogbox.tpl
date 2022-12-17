<html>
    <head>
        <title>{{translation.title}}</title>
        <style>
            body {
                font-family: Verdana, Arial, sans-serif;
                font-size: 10px;
                margin: 0;
                padding: 0;
            }
            label {
                font-size: 1.2em;
                float: left;
                padding: .2rem .5rem 0 .5rem;
            }
            a {
                text-decoration:none;
                color:#000000;
            }
            a:hover {
                text-decoration:underline;
            }
            .layout {
                padding: 0;
                margin: 0;
                height: 100%;
                width: 100%;
            }
                .title {
                    background-color:#BBBBBB;
                    color:#FFFFFF;
                    font-weight:bold;
                    padding: .8rem 0 .9rem .5rem;
                    top: 0;
                    left: 0;
                    right: 0;
                }
                .fileselect {
                    height: 14rem;
                    border: 1px solid black;
                    margin: 0.5rem;
                    overflow: auto;
                    padding-bottom: 1rem;
                }
                .foot {
                    bottom: 0;
                    left: 0;
                    right: 0;
                    padding: .8rem 0 1.5rem .5rem;
                }
                    .row {
                        margin: 0.5rem 0 0 0;
                    }
                      .row a {
                        padding-left: .5rem;
                        font-size: 1.2em;
                      }
                      .row img {
                        vertical-align: text-bottom;
                      }

                    .btn {
                        float: right;
                        margin: 0 .7rem 0 0;
                    }

                #file {
                    float: left;
                }
        </style>
        <script language="javascript">

            function chDir(dir)
            {
                var i;
                if (dir == null || dir == '') {
                    dir = '{{parentDir}}';
                }

                for (i = 0; i < document.filebrowser.currDir.options.length; i++) {
                    if (document.filebrowser.currDir.options[i].value == dir) {
                        document.filebrowser.currDir.options[i].selected = true;
                        document.filebrowser.submit();
                    }
                }
            }

            function newDir()
            {
                var newDir = prompt('{{translation.dirnamePrompt}}', '{{defaultNewDirname}}');
                document.filebrowser.act.value = 'AddDir';
                document.filebrowser.variable.value = newDir;
                document.filebrowser.submit();
            }

            function selFile(file)
            {
                document.filebrowser.filename.value = file;
            }

            function openFile()
            {
                if (document.filebrowser.filename.value == '') {
                    return;
                }
                window.opener.{{callbackName}}("{{currentDir}}/"+document.filebrowser.filename.value);
                window.close();
            }
        </script>
    </head>
    <body><div class="layout">
        <div class="title">{{translation.title}}</div>

        {{#errors}}
        <div class="errors">{{message}}</div>
        {{/errors}}

        <form name="filebrowser" action="" method="POST" enctype="multipart/form-data">
        <div class="navigation row">
            <label for="pwd">{{translation.directory}}:</label>
            <select id="pwd" name="currDir" onchange="document.filebrowser.submit();">
                <option value="{{opDir}}">/</option>
                {{#dirNavigation}}
                <option value="{{fullpath}}" selected>{{label}}</option>
                {{/dirNavigation}}
                {{#dirsInCurrentDir}}
                <option value="{{fullpath}}">{{label}}</option>
                {{/dirsInCurrentDir}}
            </select>
            <img onclick="chDir()" src="dialogimg/btnFolderUp.png" border="0" title="{{translation.directoryUp}}" />
            <img onclick="newDir()" src="dialogimg/btnFolderNew.png" border="0" title="{{translation.createDirectory}}" />
        </div>

        <div class="fileselect">
            {{#dirsInCurrentDir}}
            <div class="row">
                <a href="javascript:chDir('{{fullpath}}')" ><img src="dialogimg/folder.png" border="0" align="top" />{{name}}</a>
            </div>
            {{/dirsInCurrentDir}}
            {{#filesInCurrentDir}}
            <div class="row">
                <a href="javascript:selFile('{{name}}')" title="{{info}}"><img src="dialogimg/{{icon}}.png" border="0" align="top">&nbsp;{{name}}</a>
            </div>
            {{/filesInCurrentDir}}
        </div>

        <div class="foot">
            <div class="row">
                <label for="upl">{{translation.uploadLabel}}</label>
                <input id="upl" type="file" name="upload" />
                <input class="btn" type="submit" name=triggerUpload" value="{{translation.uploadBTLabel}}" />
            </div>

            <div class="row">
                <label for="file">{{translation.filenameLabel}}</label>
                <input id="file" name="filename" readonly="readonly" />
                <div>
                <button class="btn" onclick="openFile()" name="saveFile">{{translation.confirmBTLabel}}</button>
                <button class="btn" onclick="window.close()">{{translation.cancelBTLabel}}</button>
                </div>
            </div>
        </div>

        {{#hiddenInputs}}
        <input type="hidden" name="{{name}}" value="{{value}}" />
        {{/hiddenInputs}}
        </form>

        </div></body>
</html>
