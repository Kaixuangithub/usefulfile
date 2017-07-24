function Err=DEstim_fun(d_layers)

load R
load wave_range

%% Light E=exp(i(w*t-B*z))
s=1;% n light
d_layers=d_layers*1e-9;
k_range=2*pi./wave_range;
num_k=length(k_range);

angle_in=0; %rad
n_in=1;
n_out=2.4; %As2S3 fiber 

%% Layers information  R~0.9~0.95
n_L=1.3678; %MgF2
n_H=2.4311; %TiO2
num_layers=3;

n_layers=[repmat([n_H,n_L],1,num_layers)];
num_q=length(n_layers);

%% fitting process
%d_layers=[200 360 150 340 200 360]*10^-9+30e-9*(rand(1,num_q)-0.5)*2;
cos_angle=  sqrt(1-(n_in*sin(angle_in)./n_layers).^2);
if s==1
    N=n_layers.*cos_angle;
else
    N=n_layers./cos_angle;
end

   
phi_opt=(1./wave_range)*(n_layers.*d_layers*2*pi.*cos_angle);
rec=zeros(num_k,1);tol=0.05;

for k=1:num_k
        
        M=1;X=zeros(2,2,num_q);dX=zeros(2,2,num_q);
        for l=1:num_q;
            pt=phi_opt(k,l);
            nt=N(l);
            X(:,:,l)= [cos(pt), j*sin(pt)/nt; j*nt*sin(pt), cos(pt)];
            M=M*X(:,:,l);
        end 
        
        A=M(1,1);B=M(1,2);C=M(2,1);D=M(2,2);
        r=(A*n_in+B*n_in*n_out-C-D*n_out)/(A*n_in+B*n_in*n_out+C+D*n_out);
        


        
        rec(k)=r;
end

    R_calc=rec.*conj(rec);

    Err=1/num_k*sum((R_calc-R).^2/tol/tol);
    
end

  

