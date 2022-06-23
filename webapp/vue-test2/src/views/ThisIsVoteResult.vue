// 이 .vue파일이 /components/dataReturn.vue 파일의 부모형태 파일으로 아랫부분의 데이터를 전송해준다.
<template>
<!-- :는 v-bind:Tag이름 을 축약해서 사용 한 것과 동일한 기능이다. 이는 태그의 속성을 동적으로 변경할 때 사용(.attr()과 유사한 효과) -->
  <VotingResult :voteDatas="hubos"/>
<!--  위의 구문은 import VotingResult from "@/components/dataReturn.vue"를 통해 VotingResult라는 이름으로 components를 전달하고, 사용 할 것을 -->
<!-- 선언하는 구문이다. 아래에서 이미 Import를 통해서 선언이 된 것을 볼 수 있고 export default를 통해서 components가 (여기에서는 VotingResult)
전달이 됨을 알 수 있다.
또한 v-bind:voteDatas 커스텀 태그의 속성을 전달 할 것인데 아래와 같이 style 태그의 width 속성들이 전달되듯이(여기서 =은 같다는 의미가 아니다)
hubos 배열이 전달이 된다.
style="width: 100px; height:100px;"  -->
</template>

<script>
import VotingResult from "@/components/dataReturn.vue"

export default {
  components: {
    VotingResult
  },

  data() {
    return {
      hubos: [
        { percentage: 10, hubo: "정지훈" },
        { percentage: 30, hubo: "이지민" },
        { percentage: 20, hubo: "홍규민" },
        { percentage: 10, hubo: "여상우" },
        { percentage: 10, hubo: "임현덕" },
        { percentage: 10, hubo: "이주현" },
      ],
    }
  },
}
</script>