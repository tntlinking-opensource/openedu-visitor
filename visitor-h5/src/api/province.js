import { postAxios, getAxios} from '@/lib/http';

export const provinceApi = {
    // 添加 @author wang
    addProvince: (data) => {
        return postAxios('/province/add', data);
    },
    // 分页查询 @author wang
    queryProvince: (data) => {
        return postAxios('/province/page/query', data);
    },
    // 删除 @author wang
    deleteProvince: (id) => {
        return postAxios('/province/deleteById/'+id);
    },
    // 修改  @author wang
    updateProvince: (data) => {
        return postAxios('/province/update',data);
    },
    // 查询所有省份
    getAllProvince: () => {
        return getAxios('/province/getAll');
    },
    // 省份级联城市
    getProvinceCityCascades: () => {
        return postAxios('/province/getProvinceCityCascades');
    }
};
