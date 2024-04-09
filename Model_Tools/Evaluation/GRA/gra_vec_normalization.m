function ret_vec = gra_vec_normalization(vec,nomalize_type)
    arguments
        vec (1, :)  
        nomalize_type (1, 1) GRANomalizeType
    end
    switch(nomalize_type(1,1))
        case GRANomalizeType.Initialization
            ret_vec = vec./vec(1,1);
        case GRANomalizeType.Equalization
            ret_vec = vec./mean(vec);
    end
end

