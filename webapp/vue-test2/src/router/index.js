import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import ThisIsVoteResult from "../views/ThisIsVoteResult.vue";
// 해당 경로에 있는 파일들을 다음과 같은 이름으로 Import하였다.
// App.vue의 경로와 동일하게 component 이름을 설정(name은 큰 의미가 없다)

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/ThisIsVoteResult",
    name: "aaa",
    component: ThisIsVoteResult,
  },
  {
    path: "/about",
    name: "about",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
