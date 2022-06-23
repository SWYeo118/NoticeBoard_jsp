import { createApp } from "vue"; // vue.js가 설치되고 나서 vue 라이브러리들 중에서 createApp 메소드를 불러오기 위해 Import
import AppFile from "./App.vue"; // AppFile이라는 이름으로 App.vue 파일을 불러오기 위해서 Import
import router from "./router/index.js"; // vue.js 설치시에 manually하게 라우터를 설치하였기 때문에 router를 사용하기 위해 Import

createApp(AppFile).use(router).mount("#app");
//createApp 메소드로 기본적으로 <template>(router-link, router-view가 존재)와 <style>만 있는 App.vue 파일을 생성자로 생성
// 따라서 router-view 부분에 router-link로 클릭한 to 부분의 이름으로 연결되게 된다. (이에 대한 이름정보는 router/index.js에 있다.)
//mount(#app)은 데이터 구조에서 app 부분에 이 시스템을 마운트한다는 의미