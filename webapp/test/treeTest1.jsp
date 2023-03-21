<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tree-container {
  position: relative;
  display: block;
  width: 600px;
}

details {
  position: relative;
  width: auto;
  height: auto;
  overflow: hidden;
  max-height: 2.5em !important;
  transition: all 0.1s ease;
}
details ::-webkit-details-marker {
  display: none;
}
details > summary {
  position: relative;
  margin-top: 0.25em;
  color: white;
  padding: 0.1em 0.5em 0.2em;
  background: rgb(4, 87, 56);
}
details > summary:before {
  content: "⊞";
  color: #eee;
  font-size: 0.5em;
  margin-right: 0.5em;
}
details[open] > summary {
  background: rgb(39, 204, 27);
  color: #eee;
}
details[open] > summary:before {
  content: "⊟";
  color: #ccc;
}

.folder {
  margin: 0 0 0.5em 0.86em;
  padding: 0.5em 0em 0.5em 1.5em;
  border-left: 0.1em #ccc dotted;
  border-bottom: 0.1em #ccc dotted;
}
.folder p {
  margin: 0;
}

details[open] {
  height: auto;
  max-height: 99em !important;
  transition: all 1.2s ease;
}

details:not([open]) .folder {
  height: 0px !important;
}

</style>

</head>
<body>

<div class="tree-container">
    <details open="open">
        <summary>myproject</summary>
        <div class="folder">
            <p>app.py</p>
            <p>package.json</p>
            <details open="open">
                <summary>static</summary>
                <div class="folder">
                    <details>
                        <summary>css</summary>
                        <div class="folder">
                            <p>index.css</p>
                            <p>template.css</p>
                        </div>
                    </details>
                    <details open="open">
                        <summary>js</summary>
                        <div class="folder">
                            <p>index.js</p>
                            <p>jquery-min.js</p>
                        </div>
                    </details>
                    <details>
                        <summary>img</summary>
                        <div class="folder">
                            <p>banner.png</p>
                            <p>foo.png</p>
                        </div>
                    </details>
                </div>
            </details>
            <details open="open">
                <summary>templates</summary>
                <div class="folder">
                    <p>index.html</p>
                    <p>template.html</p>
                </div>
            </details>
        </div>
    </details>
</div>




</body>
</html>