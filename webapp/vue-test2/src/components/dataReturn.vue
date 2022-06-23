<template>

  <div class="result-box">
    <p class="title">후보별 득표율</p>
  </div>

<!-- v-for가 for문. voteDatas에 있는 hubo를 for문의 대상으로 반복한다. 아랫부분에서 props로 voteDatas가 Array 형식이라는 것이 선언됬으니
내부의 데이터는 노란색hubo라는것이 :key에 정의가 되고, 그 노란색 hubo의 hubo 속성은 빨간색 hubo가 된다.
vue에서 데이터 바인딩은 '이중 중괄호 구문(Mustache)'으로 진행되므로 해당처럼 진행 
데이터 바인딩을 태그에 사용하기 위해서는 태그에도 콜론을 붙여줘야한다?-->
  <div class="table-row" v-for="hubo in voteDatas" :key="hubo.hubo">
    <div class="name">
      {{ hubo.hubo }}
    </div>
    <div class="rate">
      <img style="width=100px"/>
      <img :style="{ width: `${hubo.percentage * 10}px` }" class="barImgae" src="../assets/bar.jpg" /> {{
          hubo.percentage
      }}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    voteDatas: Array,
  },
}
</script>

<style lang="scss">
.result-box {
  width: 100%;
  border: 2px solid black;
}

.title {
  font-size: x-large;
}

.name {
  border: 2px solid black;
  display: inline-block;
  margin: 0px;
  float: left;
  height: 50px;
  width: 10vw;
  display: flex;
  justify-content: center;
  align-items: center;
}

.rate {
  border: 2px solid black;
  display: inline-block;
  float: left;
  margin: 0px;
  height: 50px;
  width: 85vw;
  display: flex;
  align-items: center;
}

.barImgae {
  height: 30px;
}
</style>
