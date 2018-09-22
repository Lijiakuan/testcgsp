package com.equipments.management.util;

import com.github.pagehelper.Page;
import java.util.List;
/**
 * Created by Administrator on 2017/5/9.
 */
public class BeanUtil {

    public static <T> PagedResult<T> toPagedResult(List<T> datas) {
        PagedResult<T> result = new PagedResult<T>();
        if (datas instanceof Page) {
            Page page = (Page) datas;
            result.setPageNo(page.getPageNum());
            result.setPageSize(page.getPageSize());
            result.setRows(page.getResult());
            result.setTotal(page.getTotal());
            result.setPages(page.getPages());
        }
        else {
            result.setPageNo(1);
            result.setPageSize(datas.size());
            result.setRows(datas);
            result.setTotal(datas.size());
        }

        return result;
    }

}
