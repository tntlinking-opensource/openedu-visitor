<template>
  <div>
    欢迎使用访客管理系统。
  </div>
</template>

<script>
import ActivePlate from '_c/active-plate/active-plate';
import CountTo from '_c/count-to';
import HomeCard from './components/card';
import ChartPie from './components/chart-pie';
import ChartLine from './components/chart-line';
import ChartGauge from './components/chart-gauge';
import ChartBar from './components/chart-bar';
import HomeCircle from './components/home-circle';
import HomeProgress from './components/home-progress';
import ChartFunnel from './components/chart-funnel';
import Ad from '@/components/smart-admin-ad';

export default {
  name: 'Home',
  components: {
    HomeCard,
    ActivePlate,
    CountTo,
    ChartPie,
    ChartFunnel,
    ChartLine,
    HomeCircle,
    ChartGauge,
    ChartBar,
    HomeProgress,
    Ad
  },
  props: {},
  data() {
    return {
      adModal: true,
      infoCardData: [
        {
          title: '新增用户',
          icon: 'md-person-add',
          count: 803,
          color: '#11A0F8'
        },
        {title: '累计点击', icon: 'md-locate', count: 232, color: '#FFBB44 '},
        {
          title: '新增问答',
          icon: 'md-help-circle',
          count: 142,
          color: '#7ACE4C'
        },
        {title: '分享统计', icon: 'md-share', count: 657, color: '#11A0F8'},
        {
          title: '新增互动',
          icon: 'md-chatbubbles',
          count: 12,
          color: '#91AFC8'
        },
        {title: '新增页面', icon: 'md-map', count: 14, color: '#91AFC8'}
      ],
      pieData: [
        {value: 335, name: '直接访问', color: '#3AA1FF'},
        {value: 310, name: '邮件营销', color: '#36CBCB'},
        {value: 234, name: '联盟广告', color: '#4ECB73'},
        {value: 135, name: '视频广告', color: '#F47F92'},
        {value: 1548, name: '搜索引擎', color: '#FBD437'}
      ],
      lineData: {
        Mon: 13253,
        Tue: 34235,
        Wed: 26321,
        Thu: 12340,
        Fri: 24643,
        Sat: 1322,
        Sun: 1324
      }
    };
  },
  computed: {},
  watch: {},
  filters: {},
  created() {
  },
  mounted() {
  },
  beforeCreate() {
  },
  beforeMount() {
  },
  beforeUpdate() {
  },
  updated() {
  },
  beforeDestroy() {
  },
  destroyed() {
  },
  activated() {
  },
  methods: {}
};
</script>

<style lang="less">
.count-style {
  font-size: 50px;
}
</style>
