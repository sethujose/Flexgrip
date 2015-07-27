function warp_id = warp_id_generator(num_blocks, warps_per_block)
    warp_id = 0;
    for b = 0:num_blocks-1
        for w = 0:warps_per_block-1
            warp_id = b * warps_per_block + w;
        end
    end
